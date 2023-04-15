class Cdebug < Formula
  desc "Swiss army knife of container debugging"
  homepage "https://github.com/iximiuz/cdebug"
  version "0.0.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iximiuz/cdebug/releases/download/v#{version}/cdebug_darwin_arm64.tar.gz"
      sha256 "4b2081a650fccdf395f0a07bd842dd9bf08961f77977b7d7e9bc7a306c1249f3"

      def install
        bin.install "cdebug"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/iximiuz/cdebug/releases/download/v#{version}/cdebug_darwin_amd64.tar.gz"
      sha256 "6220b2b2defc44fce054fe7de0c6316673c3d5568221df5cc9e1f2483374adbe"

      def install
        bin.install "cdebug"
      end
    end
  end

  on_linux do
    url "https://github.com/iximiuz/cdebug/releases/download/v#{version}/cdebug_linux_amd64.tar.gz"
    sha256 "67fce1cf5be2dade69df9ac0a590f360a32134b148db40b37fb18f12a2bedb51"

    def install
      bin.install "cdebug"
    end
  end

  depends_on "go" => :optional

  test do
    system "#{bin}/cdebug --help"
  end
end
