class Kilar < Formula
  desc "Powerful CLI tool for managing port processes"
  homepage "https://github.com/polidog/kilar"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bca4e672f9f23ec76d005457ca180ff34d97d2fe153234319eb8bdb0bbd19069"
    else
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "58098418f0ed18f413ee0f6ea0ba94eaacc2f10cbd6fbd448f45b822d98e2ab7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b97ecc35de7f228915e84a10029882f571e5f3139f46b3c105cc65bd557203b7"
    else
      # Linux ARM version is not currently available
      odie "Linux ARM64 version is not available. Please use x86_64 version or build from source."
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