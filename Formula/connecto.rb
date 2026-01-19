class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.2.0/connecto-macos-aarch64.tar.gz"
      sha256 "abe45edd16e8ca039b40e34ee9ad4becf54a1570de1a64a995909401317a94e5"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.2.0/connecto-macos-x86_64.tar.gz"
      sha256 "124591105cc5af4e7a38baff7bf7c38c0e55056ba83505fcc2d42316bdcb17d4"
    end
  end

  def install
    bin.install "connecto"
  end

  test do
    assert_match "connecto", shell_output("#{bin}/connecto --version")
  end
end
