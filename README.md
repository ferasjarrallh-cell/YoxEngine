# YoxEngine — Xcode starter scaffold

**Important:** This is a compile-oriented app scaffold, not a completed Moonlight client. The SwiftUI launcher and build/export scripts are included; the native bridge is deliberately a stub until the exact `moonlight-common-c` revision and its headers are integrated. It will not stream GTA V yet.

## Recommended real streaming base
Moonlight's official iOS client already implements pairing, Sunshine/GameStream protocol, VideoToolbox decoding, input, audio, and display. Fork it and brand/customize its UI rather than reimplementing the protocol from partial snippets:
https://github.com/moonlight-stream/moonlight-ios

The official repo instructs cloning recursively (submodules included), opening `Moonlight.xcodeproj`, then setting signing and a unique bundle identifier. See README upstream.

## Scaffold build
1. On a Mac install Xcode and XcodeGen (`brew install xcodegen`).
2. In this folder run `xcodegen generate`.
3. Open `YoxEngine.xcodeproj`, set your Team and signing identity, then build on device.
4. Archive/export:
   `./build.sh`

`ExportOptions.plist` uses ad-hoc export by default (`method=ad-hoc`). For device installation, configure an appropriate Apple signing certificate/provisioning profile, or re-sign with KSign/ESign. An IPA cannot be produced here without macOS/Xcode and signing assets.

## Files
- `Sources/App`: SwiftUI launcher
- `Sources/Bridge`: ObjC++ bridge placeholder
- `Sources/Renderer`: VideoToolbox/Metal placeholder components
- `YoxEngine-Bridging-Header.h`: imports bridge header
- `project.yml`: XcodeGen project definition
- `build.sh`: archive/export script

## Next integration step
Pin a Moonlight iOS + `moonlight-common-c` revision and replace `YoxMoonlightBridge.mm` with calls matching that revision's `Limelight.h`. Do not copy guessed function signatures from snippets; API structs/callbacks are version-specific.
