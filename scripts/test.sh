#!/bin/bash

set -eu

PROJECT_DIR="$(git rev-parse --show-toplevel)"
XCODE_PROJECT_PATH="${PROJECT_DIR}/DJApp.xcodeproj"
SCHEME_NAME="DJApp"
DESTINATION="platform=iOS Simulator,name=iPhone 15"

xcodebuild clean test \
  -project "$XCODE_PROJECT_PATH" \
  -scheme "$SCHEME_NAME" \
  -derivedDataPath "${PROJECT_DIR}/build/XcodeDerivedData" \
  -destination "$DESTINATION"