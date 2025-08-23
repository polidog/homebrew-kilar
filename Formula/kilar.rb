class Kilar < Formula
  desc "Powerful CLI tool for managing port processes"
  homepage "https://github.com/polidog/kilar"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "53c41e3a43ff656439a44cffe2634146df05a410028067b39938223c73ae6c46"
    else
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9d02f6c463aa8ef5a0f290c4435848c4013956a4f9301c8b9126f65fa321f0d0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/polidog/kilar/releases/download/v#{version}/kilar-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1e05e2ed7b7c581ba5f5bb1d4e3019eb5fca42ee1e94faa303c670094be200e"
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