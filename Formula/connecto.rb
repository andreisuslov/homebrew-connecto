class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/ssh"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/ssh/releases/download/v#{version}/connecto-macos-aarch64.tar.gz"
      sha256 "PLACEHOLDER_ARM64_SHA256"
    else
      url "https://github.com/andreisuslov/ssh/releases/download/v#{version}/connecto-macos-x86_64.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
    end
  end

  def install
    bin.install "connecto"
  end

  test do
    assert_match "connecto", shell_output("#{bin}/connecto --version")
  end
end
