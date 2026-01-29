class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.5.0/connecto-macos-aarch64.tar.gz"
      sha256 "b2ae2dd08053054f0baf4d80294bc002a06c74a2a1e275e798f4b9c4e3b1bcd9"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.5.0/connecto-macos-x86_64.tar.gz"
      sha256 "4f8a80ebb70a0ba0ad544a444b58e6ea5ad047d059777a55d0bb20ee6d6fb55d"
    end
  end

  def install
    bin.install "connecto"
  end

  def post_install
    # Add firewall exception for connecto (requires admin, may prompt)
    system "/usr/libexec/ApplicationFirewall/socketfilterfw", "--add", "#{bin}/connecto"
    system "/usr/libexec/ApplicationFirewall/socketfilterfw", "--unblockapp", "#{bin}/connecto"
  end

  def caveats
    <<~EOS
      To allow incoming connections for connecto listen, you may need to run:
        sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add #{bin}/connecto
        sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblockapp #{bin}/connecto

      If your router blocks device-to-device traffic, use ad-hoc mode:
        connecto listen --adhoc

      This creates a direct WiFi network that other devices can join.
    EOS
  end

  test do
    assert_match "connecto", shell_output("#{bin}/connecto --version")
  end
end
