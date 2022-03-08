class Sphynx < Formula
  desc "Command-line tool to help you with your day to day tasks"
  homepage "https://github.com/hpedrorodrigues/sphynx"
  url "https://github.com/hpedrorodrigues/sphynx/archive/v0.1.18.tar.gz"
  sha256 "83f0479e86ca9ac05e4f418a28903127e5459945450eac1d5fc9abf53f3757ac"

  def install
    bin.install "sx"
    prefix.install "cli"

    ["lint", "fmt", "test"].each { | cmd |
      rm "#{prefix}/cli/#{cmd}"
    }
    ["dotfiles", "playbook"].each { | namespace |
      rm_rf "#{prefix}/cli/#{namespace}"
    }

    inreplace "#{bin}/sx" do |s|
      s.gsub! /SPHYNX_DIR=.*/, "SPHYNX_DIR=\"#{prefix}\""
    end

    ["sx.bash", "_sx", "complete"].each { | completion |
      inreplace "#{prefix}/cli/.internal/completion/#{completion}", "${SPHYNX_DIR:-}", "#{prefix}"
    }

    bash_completion.install "#{prefix}/cli/.internal/completion/sx.bash" => "sx"
    zsh_completion.install "#{prefix}/cli/.internal/completion/_sx" => "_sx"
  end

  test do
    assert_match "Sphynx", shell_output("#{bin}/sx --help")
  end
end
