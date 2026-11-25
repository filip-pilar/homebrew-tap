class Cleanpaste < Formula
  desc "Strip tracking parameters from links as you copy them"
  homepage "https://github.com/filip-pilar/cleanpaste"
  url "https://github.com/filip-pilar/cleanpaste/releases/download/v0.1.0/cleanpaste-macos-universal"
  version "0.1.0"
  sha256 "c1f558ae1312e8891235e762496b1d5ac4bb723330e3030104e0f8c61103d822"
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
