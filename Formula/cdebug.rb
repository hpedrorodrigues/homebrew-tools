class Cdebug < Formula
  desc "Swiss army knife of container debugging"
  homepage "https://github.com/iximiuz/cdebug"
  version "0.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iximiuz/cdebug/releases/download/v#{version}/cdebug_darwin_arm64.tar.gz"
      sha256 "cdee08342bf164b7237b50034d1f046e60399c9173f0f0cbde82741ed2b3d7f8"

      def install
        bin.install "cdebug"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/iximiuz/cdebug/releases/download/v#{version}/cdebug_darwin_amd64.tar.gz"
      sha256 "6b4ca419d22a9d55315f584469642ed1efdc1a24e1bc2f653a10f50c817984c9"

      def install
        bin.install "cdebug"
      end
    end
  end

  on_linux do
    url "https://github.com/iximiuz/cdebug/releases/download/v#{version}/cdebug_linux_amd64.tar.gz"
    sha256 "265c89271fa7da100f3cde0bfa65aec963dc968eb543ab0ee95046dc12827acc"

    def install
      bin.install "cdebug"
    end
  end

  depends_on "go" => :optional

  test do
    system "#{bin}/cdebug --help"
  end
end
