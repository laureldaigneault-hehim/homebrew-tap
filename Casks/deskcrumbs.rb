cask "deskcrumbs" do
  version "0.10.0"
  sha256 "a941334b18e216267a8c114d798de11caae8119daaf34e9bfd8697ebb8a0e920"

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
