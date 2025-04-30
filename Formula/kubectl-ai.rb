class KubectlAi < Formula
  desc "AI powered Kubernetes Assistant"
  homepage "https://github.com/GoogleCloudPlatform/kubectl-ai"
  version "0.0.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GoogleCloudPlatform/kubectl-ai/releases/download/v#{version}/kubectl-ai_Darwin_arm64.tar.gz"
      sha256 "72cc1a04c4497be14e818e07d2e649df6f49bae1299e4cf79a53262f80322177"

      def install
        bin.install "kubectl-ai"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/GoogleCloudPlatform/kubectl-ai/releases/download/v#{version}/kubectl-ai_Darwin_x86_64.tar.gz"
      sha256 "074e67bfccca8d603ed84a9a609249ce8dc2e15ae4c9b81656f6c9b2957ddb70"

      def install
        bin.install "kubectl-ai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/GoogleCloudPlatform/kubectl-ai/releases/download/v#{version}/kubectl-ai_Linux_x86_64.tar.gz"
      sha256 "4889bea2f852fa13aee854738224b6f85fdee579febd70a833212d15e229798f"

      def install
        bin.install "kubectl-ai"
      end
    end
    if Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
      url "https://github.com/GoogleCloudPlatform/kubectl-ai/releases/download/v#{version}/kubectl-ai_Linux_i386.tar.gz"
      sha256 "eb12863fb3e2a4fba8cc816c33f3b99ca842ba659dce04760f51cf5d1747daf7"

      def install
        bin.install "kubectl-ai"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/GoogleCloudPlatform/kubectl-ai/releases/download/v#{version}/kubectl-ai_Linux_arm64.tar.gz"
      sha256 "ebd53a13f71aedecd7f27d716cb44fcb130105ae7fa1931bd93722255c208fc4"

      def install
        bin.install "kubectl-ai"
      end
    end
  end

  test do
    system "#{bin}/kubectl-ai", "--help"
  end
end
