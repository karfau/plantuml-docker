#!/usr/bin/env bash
set -euo pipefail

rm -f jars/plantuml-*.jar

# on arch linux if gradle complains about JAVA_HOME prefix with
# JAVA_HOME=/usr/lib/jvm/default
./gradlew getDockerDeps --no-daemon

PLANTUML_VERSION=$(./plantuml-version.sh)

echo "plantuml version:$PLANTUML_VERSION"

docker build . --build-arg PLANTUML_VERSION=$PLANTUML_VERSION -t karfau/plantuml:$PLANTUML_VERSION -t karfau/plantuml:latest
