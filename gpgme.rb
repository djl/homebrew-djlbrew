require 'formula'

class Gpgme < Formula
  homepage 'http://www.gnupg.org/related_software/gpgme/'
  url 'ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-1.4.3.tar.bz2'
  sha1 'ffdb5e4ce85220501515af8ead86fd499525ef9a'

  depends_on 'gnupg'
  depends_on 'gnupg2' if build.include? 'with-gnupg2'
  depends_on 'libgpg-error'
  depends_on 'libassuan'
  depends_on 'pth'

  fails_with :llvm do
    build 2334
  end

  def install
    args = ["--disable-dependency-tracking",
            "--prefix=#{prefix}",
            "--enable-static",
            "--without-gpgsm",
            "--without-gpgconf"]
    args << "--with-gpg=#{HOMEBREW_PREFIX}/bin/gpg2" if build.include? 'with-gnupg2'
    system "./configure", *args
    system "make"
    system "make check"
    system "make install"
  end
end
