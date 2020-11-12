#!/usr/bin/env bash
set -euo pipefail

PLANTUML_VERSION=$(./plantuml-version.sh)
# print help by default (without any arguments
docker run karfau/plantuml:$PLANTUML_VERSION

# grep should find the version
docker run karfau/plantuml:$PLANTUML_VERSION -version | grep "$PLANTUML_VERSION"

# To test the installation of graphviz
docker run karfau/plantuml:$PLANTUML_VERSION -testdot
