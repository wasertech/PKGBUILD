#!/bin/sh

openssl aes-256-cbc -K $encrypted_4c2ca4326cdc_key -iv $encrypted_4c2ca4326cdc_iv -in signing.key.enc -out signing.key -d
