#!/usr/bin/env bash
set -xeuo pipefail

PLANTUML_VERSION=$(./plantuml-version.sh)
# print help by default (without any arguments
docker run karfau/plantuml:$PLANTUML_VERSION

# grep should find the version
if [[ "$PLANTUML_VERSION" = "1.2021.1" ]]; then
  docker run karfau/plantuml:$PLANTUML_VERSION -version | grep "1.2021.01"
else
  docker run karfau/plantuml:$PLANTUML_VERSION -version | grep "$PLANTUML_VERSION"
fi

# To test the installation of graphviz
docker run karfau/plantuml:$PLANTUML_VERSION -testdot

# make sure piping works (only for for single files with one page)
< test.puml docker run -i karfau/plantuml:$PLANTUML_VERSION -pipe -tsvg -nometadata > test.svg
