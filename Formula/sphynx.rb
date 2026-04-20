class Sphynx < Formula
  desc "Command-line tool to help you with your day to day tasks"
  homepage "https://github.com/hpedrorodrigues/sphynx"
  url "https://github.com/hpedrorodrigues/sphynx/archive/refs/tags/v0.2.10.tar.gz"
  sha256 "45bb0d2bf485ee8205b83ca191274878af8c13629ab0c6cc94986b4b4189db6d"
  license "Apache-2.0"
  head "https://github.com/hpedrorodrigues/sphynx.git", branch: "main"

  depends_on "bash"

  def install
    bin.install "sx"
    prefix.install "modules/cli"

    ["lint", "fmt", "test", "workstation"].each do |cmd|
      rm_rf "#{prefix}/cli/#{cmd}"
    end

    inreplace "#{bin}/sx" do |s|
      s.sub!(/SPHYNX_DIR="(.*?)\n\)"/m, "SPHYNX_DIR=\"#{prefix}\"")
      s.sub!(/SPHYNX_CLI_DIR=.*/, "SPHYNX_CLI_DIR=\"${SPHYNX_DIR}/cli\"")
    end

    inreplace "#{prefix}/cli/.internal/completion/complete" do |s|
      s.sub!(/SPHYNX_CLI_DIR=.*/, "SPHYNX_CLI_DIR=\"#{prefix}/cli\"")
    end

    ["sx.bash", "_sx"].each do |completion|
      inreplace "#{prefix}/cli/.internal/completion/#{completion}" do |s|
        s.sub!(/completion_dirname=.*/, "completion_dirname=\"#{prefix}/cli/.internal/completion\"")
      end
    end

    bash_completion.install "#{prefix}/cli/.internal/completion/sx.bash" => "sx"
    zsh_completion.install "#{prefix}/cli/.internal/completion/_sx" => "_sx"
  end

  test do
    assert_match "Sphynx", shell_output("#{bin}/sx --help")
  end
end
