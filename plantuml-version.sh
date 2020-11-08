#!/usr/bin/env bash
set -euo pipefail

ls jars/plantuml-*.jar | sed s%jars/plantuml-%% | sed s%.jar%%
