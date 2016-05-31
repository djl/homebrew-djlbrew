require 'formula'

class MuttPatched < Formula
  url 'ftp://ftp.mutt.org/pub/mutt/mutt-1.6.1.tar.gz'
  homepage 'http://www.mutt.org/'
  sha256 '98b26cecc6b1713082fc880344fa345c20bd7ded6459abe18c84429c7cf8ed20'

  option 'with-slang', 'Build against slang instead of ncurses'

  depends_on "openssl"
  depends_on 'gpgme'
  depends_on 'tokyo-cabinet'
  depends_on 'slang' if build.include? 'with-slang'

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  patch do
    url "https://sources.debian.net/data/main/m/mutt/1.6.1-1/debian/patches/neomutt/14-trash.patch"
    sha256 "cee13448c3cc291242182d06e12be211ec099353ebc42db77377b203c0bb88aa"
  end

  def install
    args = ["--disable-dependency-tracking",
            "--disable-warnings",
            "--prefix=#{prefix}",
            "--with-ssl=#{Formula["openssl"].opt_prefix}",
            "--with-sasl",
            "--with-gnutls",
            "--with-gss",
            "--enable-gpgme",
            "--enable-imap",
            "--enable-smtp",
            "--enable-pop",
            "--enable-hcache",
            "--with-tokyocabinet",
            # This is just a trick to keep 'make install' from trying to chgrp
            # the mutt_dotlock file (which we can't do if we're running as an
            # unpriviledged user)
            "--with-homespool=.mbox"]
    args << "--with-slang" if build.include? 'with-slang'

    if build.include? 'enable-debug'
      args << "--enable-debug"
    else
      args << "--disable-debug"
    end

    system "./prepare", *args
    system "make"
    system "make", "install"
  end
end
