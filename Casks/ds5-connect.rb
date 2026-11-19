# Homebrew cask for DS5 Connect by parktaeyang (third-party app; upstream has no tap).
# Upstream replaced the v1.1.0 DMG in place on 2026-09-13 (Universal 2 build), so the
# sha256 below is for that replacement. The app's own bundle version still reads 1.0.
cask "ds5-connect" do
  version "1.1.0"
  sha256 "ba30b4600db2c43e5a9f1508b8b58e9e3fd7509f6f037e54efb878c080a4f5d7"

  url "https://github.com/parktaeyang/ds5-connect-releases/releases/download/v#{version}/DS5.Connect.dmg"
  name "DS5 Connect"
  desc "Use a DualSense (PS5) controller as keyboard and mouse"
  homepage "https://parktaeyang.github.io/ds5-connect-releases/"

  depends_on :macos

  app "DS5 Connect.app"

  # The app is only ad-hoc signed (no Apple Developer ID), so macOS would refuse to open a
  # quarantined download. Clearing the quarantine flag is what "Open Anyway" does.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DS5 Connect.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.parktaeyang.ds5connect",
    "~/Library/Caches/com.parktaeyang.ds5connect",
    "~/Library/Preferences/com.parktaeyang.ds5connect.plist",
  ]
end
