class TwitterCleaner < Formula
  desc "Automatically delete tweets, retweets, and favorites from your timeline."
  homepage "https://github.com/hpedrorodrigues/twitter-cleaner"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hpedrorodrigues/twitter-cleaner/releases/download/v#{version}/twitter-cleaner_#{version}_darwin_arm64.tar.gz"
      sha256 "74ad0019beacd62d90575eb3956774b011397903a94bc2951563c4435444f959"

      def install
        bin.install "twitter-cleaner"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hpedrorodrigues/twitter-cleaner/releases/download/v#{version}/twitter-cleaner_#{version}_darwin_amd64.tar.gz"
      sha256 "031b912439062bad64480d5f917fdf35b22e1d165ce11f619d5229ce85d621a6"

      def install
        bin.install "twitter-cleaner"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hpedrorodrigues/twitter-cleaner/releases/download/v#{version}/twitter-cleaner_#{version}_linux_amd64.tar.gz"
      sha256 "a0100e87a083d40a73592a5894178100929dd961bf76ad52b25438f6731005cd"

      def install
        bin.install "twitter-cleaner"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/hpedrorodrigues/twitter-cleaner/releases/download/v#{version}/twitter-cleaner_#{version}_linux_arm64.tar.gz"
      sha256 "f2829b9c9b6258d205267b53f7e34724977d2d49fa4795694225288f00fab459"

      def install
        bin.install "twitter-cleaner"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/hpedrorodrigues/twitter-cleaner/releases/download/v#{version}/twitter-cleaner_#{version}_linux_armv7.tar.gz"
      sha256 "607a49462ce1ed2a7a949d5c8bd45f475bbfa9a093087dd992054d8c3c3b4064"

      def install
        bin.install "twitter-cleaner"
      end
    end
  end

  depends_on "go" => :optional

  test do
    system "#{bin}/twitter-cleaner --help"
  end
end
