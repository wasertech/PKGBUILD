#!/bin/bash

declare d
d=$(readlink -f "$(dirname "$0")")
openssl aes-256-cbc -K $encrypted_4c2ca4326cdc_key -iv $encrypted_4c2ca4326cdc_iv -in "$d/signing.key.enc" -out "$d/signing.key" -d
