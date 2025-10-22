#!/bin/sh
#

DEFAULT_VERSION="4.0.0.a16"
DEFAULT_URL="https://download.videolan.org/pub/cocoapods/unstable/VLCKit-4.0.0a16-95efb67d-8e3d17c89.tar.xz"

VERSION="${1:-$DEFAULT_VERSION}";
VLC_URL="${2:-$DEFAULT_URL}"

rm -rf .tmp/ || true
mkdir .tmp/

curl -L -o .tmp/VLCKit.tar.xz "$VLC_URL" || { echo "Download $VLC_URL failed"; exit 1; }
tar -xf .tmp/VLCKit.tar.xz -C .tmp/

VLC_LOCATION=".tmp/VLCKit-binary/VLCKit.xcframework"

cd "$(dirname "${VLC_LOCATION}")" && \
zip -X -r "$(basename "${VLC_LOCATION}").zip" "$(basename "${VLC_LOCATION}")" && \
cd - > /dev/null

# Update Package.swift
PACKAGE_HASH=$(sha256sum "${VLC_LOCATION}.zip" | awk '{ print $1 }')
PACKAGE_STRING="Target.binaryTarget(name: \"VLCKit\", url: \"https:\/\/github.com\/gluttony\/vlckit-spm\/releases\/download\/v${VERSION}\/VLCKit.xcframework.zip\", checksum: \"$PACKAGE_HASH\")"
echo "Updating Package.swift with hash $PACKAGE_HASH"
sed -i '' -e "s/let vlcBinary.*/let vlcBinary = $PACKAGE_STRING/" Package.swift

cp -f .tmp/VLCKit-binary/COPYING.txt ./LICENSE
