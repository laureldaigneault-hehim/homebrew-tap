cask "deskcrumbs" do
  version "0.11.1"
  sha256 "7f1006090bfc19ce312660d79c5acf8d1e5d3b68cea11c3d4c21bb7f17ff6e3a"

  url "https://deskcrumbs.com/releases/Deskcrumbs-#{version}.dmg"
  name "Deskcrumbs"
  desc "Markdown sticky notes that live on your desktops"
  homepage "https://deskcrumbs.com/"

  livecheck do
    url "https://deskcrumbs.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Deskcrumbs.app"

  uninstall quit: "com.laureldaigneault.deskcrumbs"

  zap trash: [
    "~/Library/Application Support/Deskcrumbs",
    "~/Library/Caches/com.laureldaigneault.deskcrumbs",
    "~/Library/HTTPStorages/com.laureldaigneault.deskcrumbs",
    "~/Library/Logs/Deskcrumbs.log",
    "~/Library/Preferences/com.laureldaigneault.deskcrumbs.plist",
    "~/Library/WebKit/com.laureldaigneault.deskcrumbs",
  ]

  caveats <<~EOS
    Deskcrumbs updates itself. Your stickies are Markdown files in ~/Notes/stickies;
    `brew uninstall --zap` never deletes them.
  EOS
end
