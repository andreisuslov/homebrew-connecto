class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.4.0/connecto-macos-aarch64.tar.gz"
      sha256 "acf875f52323c67c049070adf4edc871a0d4568759695e2cb39f434e555968ea"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.4.0/connecto-macos-x86_64.tar.gz"
      sha256 "30412d123d883b6446e3fdfa47d520aac2c1159aa885fd3eb1493fae4c1b9c84"
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
