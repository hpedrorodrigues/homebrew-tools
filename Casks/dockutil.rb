cask "dockutil" do
  version "3.1.3"
  sha256 "622bbb5c97f09b3f46ebea9a612f7470dd7fb6a7daaed12b87dee5af7a0177f6"

  url "https://github.com/kcrawford/dockutil/releases/download/#{version}/dockutil-#{version}.pkg"
  name "Dockutil"
  desc "Command-line utility for managing macOS dock items"
  homepage "https://github.com/kcrawford/dockutil"

  deprecate! date: "2024-02-13", because: :discontinued

  pkg "dockutil-#{version}.pkg"

  uninstall pkgutil: "dockutil.cli.tool"
end
