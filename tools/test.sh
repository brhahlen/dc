#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# 1. Syntax check
bash -n "${REPO_DIR}/dc" "${REPO_DIR}/dc-completion"

# 2. Isolated fixture with spaces in DC_DIR and mock docker CLI
TMP_ROOT="$(mktemp -d)"
trap 'rm -rf "${TMP_ROOT}"' EXIT

MOCK_BIN="${TMP_ROOT}/bin"
mkdir -p "${MOCK_BIN}"
LOG_FILE="${TMP_ROOT}/docker.log"

cat > "${MOCK_BIN}/docker" <<'EOF'
#!/usr/bin/env bash
echo "$*" >> "${MOCK_DOCKER_LOG}"
if [ "$1" = "compose" ]; then
    case "$*" in
        *"config --services"*)
            if [[ "$*" == *"alpha"* ]]; then
                printf "web\ndb\n"
            else
                printf "api\ndb\n"
            fi
            ;;
    esac
elif [ "$1" = "ps" ]; then
    exit 0
fi
EOF
chmod +x "${MOCK_BIN}/docker"

export PATH="${MOCK_BIN}:${PATH}"
export MOCK_DOCKER_LOG="${LOG_FILE}"
export XDG_CACHE_HOME="${TMP_ROOT}/cache"
export DC_DIR="${TMP_ROOT}/my docker"

mkdir -p "${DC_DIR}/alpha" "${DC_DIR}/beta"
touch "${DC_DIR}/.env" "${DC_DIR}/alpha/compose.yml" "${DC_DIR}/alpha/alpha.env"
touch "${DC_DIR}/beta/docker-compose.yaml" "${DC_DIR}/beta/beta.env"

# Test list populates cache once per stack
out=$("${REPO_DIR}/dc" list)
grep -q "web" <<< "${out}"
grep -q "api" <<< "${out}"
config_calls=$(grep -c "config --services" "${LOG_FILE}")
[ "${config_calls}" -eq 2 ] || { echo "Expected 2 config calls, got ${config_calls}"; exit 1; }

# Test service resolution with spaces in DC_DIR
: > "${LOG_FILE}"
"${REPO_DIR}/dc" start web > /dev/null
grep -q -- "--project-directory ${DC_DIR}/alpha up -d web" "${LOG_FILE}"

# Test multi-stack service collision
out=$("${REPO_DIR}/dc" start db)
grep -q "multiple stacks" <<< "${out}"

# Test ips with no containers
out=$("${REPO_DIR}/dc" ips)
grep -q "No containers found" <<< "${out}"

# Test dc-completion does not exit shell and completes stacks/services
bash -c '
    set -euo pipefail
    source "'"${REPO_DIR}"'/dc-completion"
    COMP_WORDS=(dc up "")
    COMP_CWORD=2
    _dc_completions
    [[ " ${COMPREPLY[*]} " == *" alpha "* ]]
    [[ " ${COMPREPLY[*]} " == *" all "* ]]

    COMP_WORDS=(dc start "")
    COMP_CWORD=2
    _dc_completions
    [[ " ${COMPREPLY[*]} " == *" web "* ]]

    DC_DIR="/nonexistent_dc_dir"
    _dc_completions
'

echo "All tests passed."
