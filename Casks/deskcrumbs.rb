cask "deskcrumbs" do
  version "0.9.2"
  sha256 "f716fb10e100e2030572bde986b3df123c46d586f0fbfdd286f74c8efd48eabe"

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
