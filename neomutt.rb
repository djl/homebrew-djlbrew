require 'formula'

class Neomutt < Formula
  url 'https://github.com/neomutt/neomutt/archive/neomutt-20160404.tar.gz'
  homepage 'http://www.neomutt.org/2016/04/04/release'
  sha256 'c864a47e36e97b530c3623a69dc9215482d1641c7b964c76f64885ef7bf4dfff'

  option 'with-slang', 'Build against slang instead of ncurses'

  depends_on "openssl"
  depends_on 'gpgme'
  depends_on 'tokyo-cabinet'
  depends_on 'slang' if build.include? 'with-slang'

  depends_on "autoconf" => :build
  depends_on "automake" => :build

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
