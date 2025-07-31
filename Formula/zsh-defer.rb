class ZshDefer < Formula
  desc "Defers execution of a zsh command until zsh has nothing else to do"
  homepage "https://github.com/romkatv/zsh-defer"
  version "head"
  url "https://github.com/romkatv/zsh-defer/archive/refs/heads/master.tar.gz"
  sha256 "7d25cedd0590c9b9dbcf01c88f1b15257fd3dbfc5319dfbfb95606e6791dcb7f"
  license "GPL-3.0"
  head "https://github.com/romkatv/zsh-defer.git", branch: "master"

  uses_from_macos "zsh" => :test

  def install
    pkgshare.install "zsh-defer.plugin.zsh"
  end

  def caveats
    <<~EOS
      To activate the zsh-defer, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-defer/zsh-defer.plugin.zsh

      You will also need to restart your terminal for this change to take effect.
    EOS
  end

  test do
    assert_match "0",
      shell_output("zsh -c '. #{pkgshare}/zsh-defer.plugin.zsh && echo $#_zsh_defer_tasks'")
  end
end
