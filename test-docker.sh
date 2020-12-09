#!/usr/bin/env bash
set -euo pipefail

PLANTUML_VERSION=$(./plantuml-version.sh)
# print help by default (without any arguments
docker run karfau/plantuml:$PLANTUML_VERSION

# grep should find the version
docker run karfau/plantuml:$PLANTUML_VERSION -version | grep "$PLANTUML_VERSION"

# To test the installation of graphviz
docker run karfau/plantuml:$PLANTUML_VERSION -testdot

# make sure piping works (only for for single files with one page)
< test.puml docker run -i karfau/plantuml:$PLANTUML_VERSION -pipe -tsvg -nometadata > test.svg
