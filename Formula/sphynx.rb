class Sphynx < Formula
  desc "Command-line tool to help you with your day to day tasks"
  homepage "https://github.com/hpedrorodrigues/sphynx"
  url "https://github.com/hpedrorodrigues/sphynx/archive/v0.1.14.tar.gz"
  sha256 "90bab024570fe3416a17fe940e793e050cfa5eefbc9576fae4cd551b749a55fa"

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
