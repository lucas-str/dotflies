#!/bin/bash

PLUGINS_FOLDER="$HOME/.local/share/zellij/plugins"

mkdir -p "$PLUGINS_FOLDER"
curl -Lo "$PLUGINS_FOLDER/zfz.wasm" 'https://framagit.org/lucas-str/zellij-zfz/-/jobs/artifacts/main/raw/bin/zfz.wasm?job=build-job'
