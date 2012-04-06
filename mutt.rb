require 'formula'

class Mutt < Formula
  url 'ftp://ftp.mutt.org/mutt/devel/mutt-1.5.21.tar.gz'
  homepage 'http://www.mutt.org/'
  md5 'a29db8f1d51e2f10c070bf88e8a553fd'

  depends_on 'tokyo-cabinet'
  depends_on 'slang'

  def options
    [
      ['--enable-debug', "Build with debug option enabled"],
    ]
  end

  def patches
    # I only care about the trash patch
    ['https://gist.github.com/raw/1361946/632541cf9ae54e3d1caed5c748149962f8972c28/mutt-trash-folder.patch']
  end

  def install
    args = ["--disable-dependency-tracking",
            "--disable-warnings",
            "--disable-debug",
            "--prefix=#{prefix}",
            "--with-ssl",
            "--with-sasl",
            "--with-gnutls",
            "--with-gss",
            "--enable-imap",
            "--enable-smtp",
            "--enable-pop",
            "--enable-hcache",
            "--with-tokyocabinet",
            # This is just a trick to keep 'make install' from trying to chgrp
            # the mutt_dotlock file (which we can't do if we're running as an
            # unpriviledged user)
            "--with-homespool=.mbox",
            "--with-slang"]
    system "./configure", *args
    system "make install"
  end
end

