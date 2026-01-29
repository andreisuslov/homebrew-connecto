class Connecto < Formula
  desc "AirDrop-like SSH key pairing for your terminal"
  homepage "https://github.com/andreisuslov/connecto"
  license "MIT"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreisuslov/connecto/releases/download/v0.4.1/connecto-macos-aarch64.tar.gz"
      sha256 "c1904c34540e20dc516116c3499b659fe529713dbf3233e5fd0619e5cb37884b"
    else
      url "https://github.com/andreisuslov/connecto/releases/download/v0.4.1/connecto-macos-x86_64.tar.gz"
      sha256 "2fada6dc297a558c5af3281cab2d234e101ae55c478d32c9a73c16f996da84e2"
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
