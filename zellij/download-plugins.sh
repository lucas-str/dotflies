#!/bin/bash

PLUGINS_FOLDER="$HOME/.local/share/zellij/plugins"
ARTIFACT_URL='https://framagit.org/lucas-str/zellij-zfz/-/jobs/artifacts/main/raw/bin/zfz.wasm?job=build-job'

mkdir -p "$PLUGINS_FOLDER"
echo "Downloading $ARTIFACT_URL"
curl -sLo "/tmp/zfz.wasm" "$ARTIFACT_URL"

if [[ $(file /tmp/zfz.wasm) =~ WebAssembly.* ]]; then
    mv /tmp/zfz.wasm "$PLUGINS_FOLDER/zfz.wasm"
else
    echo "ERROR: wrong file type:"
    file /tmp/zfz.wasm
fi
