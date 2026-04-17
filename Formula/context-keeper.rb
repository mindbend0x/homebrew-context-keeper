class ContextKeeper < Formula
  desc "Temporal knowledge graph memory system"
  homepage "https://github.com/mindbend0x/context-keeper"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-apple-darwin"
      sha256 "51e64cf44f16a24687ae5d67726ca60928fba31006c75e5d0ab73e700698318d"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-apple-darwin"
      sha256 "4b95cd78d6f7356cf559fc0982b059ecf5f952b41dddf09020a0c01c3644ca57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-unknown-linux-gnu"
      sha256 "96a0691240c1c3ee1fbfecdf985d8c0104d1ad7e0b27e2257df2a952b9900960"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-unknown-linux-gnu"
      sha256 "9d07e790707411d55950263a461f02f8cf4ea3d1c3c598358e3a23cee23b2da1"
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
