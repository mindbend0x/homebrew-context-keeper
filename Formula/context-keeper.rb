class ContextKeeper < Formula
  desc "Temporal knowledge graph memory system"
  homepage "https://github.com/mindbend0x/context-keeper"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-apple-darwin"
      sha256 "3a44b4ced927a59678b97855a39d09ee2e3dd3c48d112d90f897a7e87b7e8aeb"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-apple-darwin"
      sha256 "7b46878bf23320b241c36f35f0d8e2bc0fb822887cd54de6e1c944c57ea75372"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-aarch64-unknown-linux-gnu"
      sha256 "16728c919b93d5780a5561d1628d641a6d75186c3846d4ed5ba3af64d254abcc"
    else
      url "https://github.com/mindbend0x/context-keeper/releases/download/v#{version}/context-keeper-cli-x86_64-unknown-linux-gnu"
      sha256 "08c4ed1042da510e341d6f6018531b07102edbb5bb9720f7f1eb6edc5e31e681"
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
