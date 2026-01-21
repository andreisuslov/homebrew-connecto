class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.3.0/connecto-macos-aarch64.tar.gz"
      sha256 "d919bbaffb60b5bb4ba7064be1b2e1028825c4ba5555cce2469909e78bb483c1"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.3.0/connecto-macos-x86_64.tar.gz"
      sha256 "57e3328a73826283bbaa6453dd08039caea8f5b20b7a8550ddec431251590840"
    end
  end

  def install
    bin.install "connecto"
  end

  test do
    assert_match "connecto", shell_output("#{bin}/connecto --version")
  end
end
