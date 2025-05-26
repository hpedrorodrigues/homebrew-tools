cask "kafkio" do
  version "1.2.1"
  sha256 "d0509974a46d6bc1de5eeb88b005436f8320534531ca80080883a602bbaef135"

  url "https://kafkio.com/download/kafkio/#{version}/KafkIO-macos-#{version}-x64.pkg"
  name "KafkIO"
  desc "The Fast, Easy Apache Kafka™ GUI, for Engineers and Administrators"
  homepage "https://kafkio.com/"

  pkg "KafkIO-macos-#{version}-x64.pkg"

  uninstall pkgutil: "com.certak.KafkIO"
end
