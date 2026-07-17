cask "kitebar" do
  version "2.0.0"
  sha256 "3c9684bedc449ba40f13fbda6fd8bd24d6eb90a93e3fdcf0da184e6c12b75808"

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
    KiteBar is not notarized (no Apple Developer subscription), so macOS
    will refuse to launch it ("damaged") until you clear the quarantine
    flag. Before first launch, run:

      xattr -rd com.apple.quarantine /Applications/KiteBar.app
  EOS
end
