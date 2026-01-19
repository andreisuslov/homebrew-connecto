class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.2.0/connecto-macos-aarch64.tar.gz"
      sha256 "a08f3ad36366b816f43232f578ec017df2a1aef60bb77fa0a4e09321db178e88"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.2.0/connecto-macos-x86_64.tar.gz"
      sha256 "e5234f6b5dd7388131cbd1a2477c44128e77e08009ee6c50919c5e0482c94f56"
    end
  end

  def install
    bin.install "connecto"
  end

  test do
    assert_match "connecto", shell_output("#{bin}/connecto --version")
  end
end
