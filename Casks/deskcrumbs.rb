cask "deskcrumbs" do
  version "0.9.1"
  sha256 "b5c3e1b60faee30de066bc1af6e4a3426accb7045fb0532fc9113e4a2fc683bc"

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
