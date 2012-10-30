require 'formula'

class Mutt < Formula
  url 'ftp://ftp.mutt.org/mutt/devel/mutt-1.5.21.tar.gz'
  homepage 'http://www.mutt.org/'
  md5 'a29db8f1d51e2f10c070bf88e8a553fd'

  depends_on 'tokyo-cabinet'
  depends_on 'slang' if ARGV.include? '--with-slang'

  def patches
    [
     'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2/features/trash-folder',
     'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2/features/purge-message',
     'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2/features/imap_fast_trash',
     'https://raw.github.com/gist/3982448/56c7cbafe3759c737bf8d9c55d5b9e7bdfb48628/mutt-short-mailbox.patch',
    ]
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
            "--with-homespool=.mbox"]
    args << "--with-slang" if ARGV.include? '--with-slang'

    if ARGV.include? '--enable-debug'
      args << "--enable-debug"
    else
      args << "--disable-debug"
    end

    system "./configure", *args
    system "make install"
  end
end

