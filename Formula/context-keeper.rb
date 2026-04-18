class ContextKeeper < Formula
  desc "Temporal knowledge graph memory system"
  homepage "https://github.com/mindbend0x/context-keeper"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-apple-darwin"
      sha256 "7a53796a2e4bf05506134e56c5e6ddcab4bccd037460d246c2447b2e74d031b6"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-apple-darwin"
      sha256 "c9d2dd96dc2a4b0c5efd586050b7a7e5adf3196e4b2e298ebb9c5d509f6c2ec3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-unknown-linux-gnu"
      sha256 "446afd524eebb9c0fbabcab81d9948fb0e0bfd763674efcc27de541d11d402fd"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-unknown-linux-gnu"
      sha256 "36bbb322b720cc47e1051111a4cb3336ac5cd5449036189f2ad74eefbf7fa196"
    end
  end

  def install
    binary = Dir["context-keeper-cli-*"].first
    bin.install binary => "context-keeper"
  end

  test do
    assert_match "context-keeper", shell_output("#{bin}/context-keeper --version")
  end
end
