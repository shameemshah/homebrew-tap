cask "kitebar" do
  version "0.0.1"
  sha256 "bf83f5176529e7c87d4d40032fab7b75d29df64eced73f6fdb81b2e586b63c67"

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
