#!/bin/bash
PARENT=$( cd "$(dirname "${BASH_SOURCE[0]}")" || exit ; pwd -P )
AGENT_DIR="paper-exception-java-agent"
RESOURCES_DIR="${PARENT}/resources"

# Resource creation
rm -r "${RESOURCES_DIR}"
mkdir "${RESOURCES_DIR}"

# maven execution function
## $1 => java directory
## $2 => jar name
function exec_mvn {
  echo "<==============>"
  echo "Executing maven build: mvn -f \"${AGENT_DIR}/pom.xml\" clean package"
  echo "<==============>"
  mvn -f "$1/pom.xml" clean package
  mv "${PARENT}/$1/target/$2.jar" "${RESOURCES_DIR}"
}

# Java agent creation
exec_mvn paper-exception-java-agent PaperAgent

# Rust binary creation
RUST_FLAGS="--color=always"

if [ -n "$1" ]; then
  RUST_COMMAND="cargo build $RUST_FLAGS $*"
else
  RUST_COMMAND="cargo build $RUST_FLAGS"
fi

echo "<==============>"
echo "Executing rust build: $RUST_COMMAND"
echo "<==============>"

cargo clean
$RUST_COMMAND