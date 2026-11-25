class Cleanpaste < Formula
  desc "Strip tracking parameters from links as you copy them"
  homepage "https://github.com/filip-pilar/cleanpaste"
  url "https://github.com/filip-pilar/cleanpaste/releases/download/v0.1.1/cleanpaste-macos-universal"
  sha256 "ea5242dd24fb8ec29455db2492760e18ef363f09c368d05e9353768a3e02b2a5"
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
