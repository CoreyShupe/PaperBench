#!/bin/bash
PARENT=$( cd "$(dirname "${BASH_SOURCE[0]}")" || exit ; pwd -P )
AGENT_DIR="paper-exception-java-agent"
RESOURCES_DIR="${PARENT}/resources"

rm -r "${RESOURCES_DIR}"
mkdir "${RESOURCES_DIR}"
mvn -f "${AGENT_DIR}/pom.xml" clean package
mv "${PARENT}/${AGENT_DIR}/target/PaperAgent.jar" "${RESOURCES_DIR}"