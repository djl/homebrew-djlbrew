require 'formula'

class Emacs < Formula
  homepage 'http://www.gnu.org/software/emacs/'
  url 'http://ftpmirror.gnu.org/emacs/emacs-24.3.tar.gz'
  mirror 'http://ftp.gnu.org/pub/gnu/emacs/emacs-24.3.tar.gz'
  sha256 '0098ca3204813d69cd8412045ba33e8701fa2062f4bff56bedafc064979eef41'

  depends_on :autoconf
  depends_on :automake

  def install
     inreplace "src/nsterm.m",
       "*col = [NSColor colorWithCalibratedRed: r green: g blue: b alpha: 1.0];",
       "*col = [NSColor colorWithDeviceRed: r green: g blue: b alpha: 1.0];"
    system "./configure", "--with-ns"
    system "make bootstrap"
    system "make install"
    prefix.install "nextstep/Emacs.app"
  end

  def caveats
    "Emacs.app was installed to: #{prefix}"
  end
end
