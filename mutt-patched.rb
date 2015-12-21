require 'formula'

class MuttPatched < Formula
  url 'https://bitbucket.org/mutt/mutt/downloads/mutt-1.5.24.tar.gz'
  homepage 'http://www.mutt.org/'
  sha1 '38a2da5eb01ff83a90a2caee28fa2e95dbfe6898'

  option 'with-slang', 'Build against slang instead of ncurses'

  depends_on 'gpgme'
  depends_on 'tokyo-cabinet'
  depends_on 'slang' if build.include? 'with-slang'

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def patches
    [
      'https://raw.github.com/djl/patches/master/mutt/trash-folder.patch',
      'https://raw.github.com/djl/patches/master/mutt/purge-message.patch',
      'https://raw.github.com/djl/patches/master/mutt/imap_fast_trash.patch',
    ]
  end

  def install
    args = ["--disable-dependency-tracking",
            "--disable-warnings",
            "--prefix=#{prefix}",
            "--with-ssl",
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
