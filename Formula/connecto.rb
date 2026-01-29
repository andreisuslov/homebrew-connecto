class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.4.2/connecto-macos-aarch64.tar.gz"
      sha256 "2c671509820d814a9ed6a0060e93a0597ca3171a72b1ed17d6dbe462a4191f5f"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.4.2/connecto-macos-x86_64.tar.gz"
      sha256 "035f46064087dc555264b759c30a54b12233901a2305622137aac1e85ffa1001"
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

      Or disable the firewall temporarily in System Settings → Privacy & Security → Firewall
    EOS
  end

  test do
    assert_match "connecto", shell_output("#{bin}/connecto --version")
  end
end
