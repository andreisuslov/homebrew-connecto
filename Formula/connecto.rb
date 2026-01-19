class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.1.0/connecto-macos-aarch64.tar.gz"
      sha256 "0a1e5e51538fd4bb9308c482922070a4610dfaac23b553049fdcf13c321f9fde"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.1.0/connecto-macos-x86_64.tar.gz"
      sha256 "763b0cd1c0c188e28953771048b0b383912678d7ac21de46e37111c1de2bfbfe"
    end
  end

  def install
    bin.install "connecto"
  end

  test do
    assert_match "connecto", shell_output("#{bin}/connecto --version")
  end
end
