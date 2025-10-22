#!/bin/bash

gh release create "v${1}" .tmp/VLCKit-binary/VLCKit.xcframework.zip --title "${1}" --notes "${1}";