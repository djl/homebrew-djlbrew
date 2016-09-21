require 'formula'

class Traytoggle < Formula
  url 'https://github.com/djl/traytoggle/archive/1.0.0.tar.gz'
  homepage 'https://github.com/djl/traytoggle/releases'
  sha256 'f74d4c588fa883a6526e4f49142b302e046a7a5873b6581f2dfd512c096c41a9'

  def install
    system "make"
    bin.install "traytoggle"
  end
end
