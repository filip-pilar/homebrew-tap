class Cleanpaste < Formula
  desc "Strip tracking parameters from links as you copy them"
  homepage "https://github.com/filip-pilar/cleanpaste"
  url "https://github.com/filip-pilar/cleanpaste/releases/download/v0.1.0/cleanpaste-macos-universal"
  sha256 "c1f558ae1312e8891235e762496b1d5ac4bb723330e3030104e0f8c61103d822"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanpaste-macos-universal" => "cleanpaste"
  end

  def caveats
    <<~EOS
      If you installed cleanpaste with the curl script before, remove that copy first
      so two copies do not run at once:
        curl -fsSL https://raw.githubusercontent.com/filip-pilar/cleanpaste/main/install.sh | sh -s -- --uninstall
    EOS
  end

  service do
    run opt_bin/"cleanpaste"
    keep_alive successful_exit: false
  end

  test do
    assert_predicate bin/"cleanpaste", :executable?
  end
end
