class Kilar < Formula
  desc "Powerful CLI tool for managing port processes"
  homepage "https://github.com/polidog/kilar"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4684587da7440846a0c1a00ee582040f492b4a40fa848450959064b41467d1d8"
    else
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8551c72756a40779df5d423f42d55a462fba82981714c2e226eba1aaa1afedbb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4dbd901ed3bea50ca045f9853014f7b0eceed0890459cee3c16cd60d134cf839"
    else
      # Linux ARM version is not currently available
      odie "Linux ARM24 version is not available. Please use x86_64 version or build from source."
    end
  end

  def install
    bin.install "kilar"
  end

  test do
    # Test basic command execution
    assert_match "kilar #{version}", shell_output("#{bin}/kilar --version")
    
    # Test help command
    assert_match "A powerful CLI tool for managing port processes", shell_output("#{bin}/kilar --help")
    
    # Test list command (should work without errors)
    system "#{bin}/kilar", "list", "--help"
  end
end