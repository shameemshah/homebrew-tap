cask "kitebar" do
  version "2.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/shameemshah/kitebar/releases/download/v#{version}/KiteBar-#{version}.dmg"
  name "KiteBar"
  desc "Live P&L of your Zerodha holdings in the menu bar"
  homepage "https://github.com/shameemshah/kitebar"

  # Every Apple Silicon Mac ships with macOS 11+, so arch alone covers it.
  depends_on arch: :arm64
  depends_on :macos

  app "KiteBar.app"

  zap trash: [
    "~/Library/Application Support/KiteBar",
    "~/Library/LaunchAgents/com.shameemshah.kitebar.plist",
  ]

  caveats <<~EOS
    KiteBar is not notarized (no Apple Developer subscription). If you did
    not install with --no-quarantine, the first launch needs:
      right-click KiteBar.app -> Open -> Open
    or: xattr -d com.apple.quarantine /Applications/KiteBar.app
  EOS
end
