#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
command -v xcodegen >/dev/null || { echo "Install XcodeGen: brew install xcodegen"; exit 1; }
xcodegen generate
mkdir -p build
xcodebuild -project YoxEngine.xcodeproj -scheme YoxEngine -configuration Release \
  -sdk iphoneos -destination 'generic/platform=iOS' \
  -archivePath "$PWD/build/YoxEngine.xcarchive" archive
xcodebuild -exportArchive \
  -archivePath "$PWD/build/YoxEngine.xcarchive" \
  -exportPath "$PWD/build/IPA" \
  -exportOptionsPlist "$PWD/ExportOptions.plist"
echo "Export location: $PWD/build/IPA/"
