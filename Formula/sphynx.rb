class Sphynx < Formula
  desc "Command-line tool to help you with your day to day tasks"
  homepage "https://github.com/hpedrorodrigues/sphynx"
  url "https://github.com/hpedrorodrigues/sphynx/archive/v0.2.0.tar.gz"
  sha256 "ac09b6a5b7a2a10583f20c71cd9ff2882f1a6797c379a47e46f9dc5852c1a188"

  def install
    bin.install "sx"
    prefix.install "modules/cli"

    ["lint", "fmt", "test", "workstation"].each { | cmd |
      rm_rf "#{prefix}/cli/#{cmd}"
    }

    inreplace "#{bin}/sx" do |s|
      s.gsub! /SPHYNX_DIR=.*/, "SPHYNX_DIR=\"#{prefix}\""
      s.gsub! /SPHYNX_CLI_DIR=.*/, "SPHYNX_CLI_DIR=\"${SPHYNX_DIR}/cli\""
    end

    inreplace "#{prefix}/cli/.internal/completion/complete" do |s|
      s.gsub! /SPHYNX_CLI_DIR=.*/, "SPHYNX_CLI_DIR=\"#{prefix}/cli\""
    end

    ["sx.bash", "_sx"].each { | completion |
      inreplace "#{prefix}/cli/.internal/completion/#{completion}" do |s|
        s.gsub! /completion_dirname=.*/, "completion_dirname=\"#{prefix}/cli/.internal/completion\""
      end
    }

    bash_completion.install "#{prefix}/cli/.internal/completion/sx.bash" => "sx"
    zsh_completion.install "#{prefix}/cli/.internal/completion/_sx" => "_sx"
  end

  test do
    assert_match "Sphynx", shell_output("#{bin}/sx --help")
  end
end
