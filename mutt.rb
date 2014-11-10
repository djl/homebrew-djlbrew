require 'formula'

class Mutt < Formula
  url 'https://bitbucket.org/mutt/mutt/downloads/mutt-1.5.23.tar.gz'
  homepage 'http://www.mutt.org/'
  sha1 '8ac821d8b1e25504a31bf5fda9c08d93a4acc862'
  revision 1000

  depends_on 'gpgme'
  depends_on 'tokyo-cabinet'
  depends_on 'slang' if build.include? 'with-slang'

  option 'with-slang', 'Build against slang instead of ncurses'

  def patches
    [
     'https://raw.github.com/djl/patches/master/mutt/trash-folder.diff',
     'https://raw.github.com/djl/patches/master/mutt/imap-fast-trash.diff',
     'https://raw.github.com/djl/patches/master/mutt/purge-message.diff',
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

    system "./configure", *args
    system "make install"
  end
end

