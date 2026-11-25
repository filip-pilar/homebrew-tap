class Cleanpaste < Formula
  desc "Strip tracking parameters from links as you copy them"
  homepage "https://github.com/filip-pilar/cleanpaste"
  url "https://github.com/filip-pilar/cleanpaste/releases/download/v0.0.0/cleanpaste-macos-universal"
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanpaste-macos-universal" => "cleanpaste"
  end

  def caveats
    <<~EOS
      Start it now and at every login:
        brew services start cleanpaste
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
