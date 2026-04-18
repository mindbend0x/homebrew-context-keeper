class ContextKeeper < Formula
  desc "Temporal knowledge graph memory system"
  homepage "https://github.com/mindbend0x/context-keeper"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-apple-darwin"
      sha256 "b98ca581ce1f231de2f49c8809c1583704fd019162b26421382011327499447f"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-apple-darwin"
      sha256 "fe72459464e4d5b6c3aaae967494507baecb354ad499d9e57c7b6e5355d64984"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-unknown-linux-gnu"
      sha256 "f2d3825b61db0a4bad2369258c06a432cc9421ea5da8ca1c7614f04f40747f98"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-unknown-linux-gnu"
      sha256 "2bb3c05c8eadc1346b4b0512d014e34c48e2be20248dcc029b44241e24d493b4"
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
