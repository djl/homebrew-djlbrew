require 'formula'

class Emacs < Formula
  homepage 'http://www.gnu.org/software/emacs/'
  url 'http://ftpmirror.gnu.org/emacs/emacs-24.3.tar.gz'
  mirror 'http://ftp.gnu.org/pub/gnu/emacs/emacs-24.3.tar.gz'
  sha256 '0098ca3204813d69cd8412045ba33e8701fa2062f4bff56bedafc064979eef41'

  option "srgb", "Enable sRGB colors in the Cocoa version of emacs"
  option "use-git-head", "Use Savannah git mirror for HEAD builds"

  head 'bzr://http://bzr.savannah.gnu.org/r/emacs/trunk'

  depends_on :autoconf
  depends_on :automake

  fails_with :llvm do
    build 2334
    cause "Duplicate symbol errors while linking."
  end

  def install
    # HEAD builds are currently blowing up when built in parallel
    # as of April 20 2012
    ENV.j1 if build.head?

    # See: https://github.com/mxcl/homebrew/issues/4852
    if build.head? and File.exists? "./autogen/copy_autogen"
      system "autogen/copy_autogen"
    end

    # Patch for color issues described here:
    # http://debbugs.gnu.org/cgi/bugreport.cgi?bug=8402
    if build.include? "srgb"
      inreplace "src/nsterm.m",
        "*col = [NSColor colorWithCalibratedRed: r green: g blue: b alpha: 1.0];",
        "*col = [NSColor colorWithDeviceRed: r green: g blue: b alpha: 1.0];"
    end

    system "./configure", "--with-ns"
    system "make clean"
    system "make install"
    prefix.install "nextstep/Emacs.app"
  end

  def caveats
    "Emacs.app was installed to: #{prefix}"
  end
end
