#!/usr/bin/env bash
set -eEuo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

# Download lwc data from http://lwc.daanvanesch.nl/openaccess.php

for n in "cities" "messages" "provinces" "statistics" "words"; do
    if [[ -f "lwc/LWC-${n}.zip" ]]; then
        continue
    fi
    curl -L "http://lwc.daanvanesch.nl/download.php?file=${n}" -o "lwc/LWC-${n}.zip"
done