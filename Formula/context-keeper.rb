class ContextKeeper < Formula
  desc "Temporal knowledge graph memory system"
  homepage "https://github.com/mindbend0x/context-keeper"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-apple-darwin"
      sha256 "c4843375df045a06503536b1aea7f4f21be33df2234218c5532970d83fc5f5f1"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-apple-darwin"
      sha256 "586126b59d26592f001ee6fb645d27e842a9c85907fad45bf554249625fcb946"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-unknown-linux-gnu"
      sha256 "b9bf60d43f45f8ac2dea6348c6a48c760200b0c32dffc89077353ea982e83756"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-unknown-linux-gnu"
      sha256 "59b601b5a6d06172e6cda6c6b5e69d95d7c9e67c2f1373b2ff9666834bebed73"
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
