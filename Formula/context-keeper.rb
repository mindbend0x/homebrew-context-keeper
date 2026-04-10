class ContextKeeper < Formula
  desc "Temporal knowledge graph memory system"
  homepage "https://github.com/mindbend0x/context-keeper"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-macos-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-macos-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-linux-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-linux-x64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    binary = Dir["context-keeper-*"].first
    bin.install binary => "context-keeper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/context-keeper --version")
  end
end
