class Cleanpaste < Formula
  desc "Strip tracking parameters from links as you copy them"
  homepage "https://github.com/filip-pilar/cleanpaste"
  url "https://github.com/filip-pilar/cleanpaste/releases/download/v0.1.3/cleanpaste-macos-universal"
  sha256 "f0419aeefb30ee1a5fac8550e44ef398072fb314b3161bec538c56f991f2ba35"
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
