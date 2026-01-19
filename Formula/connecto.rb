class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.1.1/connecto-macos-aarch64.tar.gz"
      sha256 "b81bfa85ddd8b63880fbb3acacb545aa590642090a5cd675032ea93cae6924e9"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.1.1/connecto-macos-x86_64.tar.gz"
      sha256 "774652264430d233f0a7f4a395c6bcddb8e1efc295551275956343757975cd03"
    end
  end

  def install
    bin.install "connecto"
  end

  test do
    assert_match "connecto", shell_output("#{bin}/connecto --version")
  end
end
