class Cleanpaste < Formula
  desc "Strip tracking parameters from links as you copy them"
  homepage "https://github.com/filip-pilar/cleanpaste"
  url "https://github.com/filip-pilar/cleanpaste/releases/download/v0.1.2/cleanpaste-macos-universal"
  sha256 "0649f680dc20822a938d8eb471473c56bd46506a1ec6492490b41bf28e154b1a"
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
