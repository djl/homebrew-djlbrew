require 'formula'

class Mutt < Formula
  url 'ftp://ftp.mutt.org/mutt/devel/mutt-1.5.22.tar.gz'
  homepage 'http://www.mutt.org/'
  sha1 '728a114cb3a44df373dbf1292fc34dd8321057dc'

  depends_on 'djl/djlbrew/gpgme'
  depends_on 'tokyo-cabinet'
  depends_on 'slang' if build.include? 'with-slang'

  option 'imap-fast-trash-patch', 'Apply the IMAP fast trash patch'
  option 'purge-message-patch', 'Apply the purge message patch (requires trash patch)'
  option 'short-mailbox-patch', 'Apply the short mailbox patch'
  option 'trash-patch', 'Apply the trash folder patch'
  option 'with-slang', 'Build against slang instead of ncurses'

  def patches
    urls = {
      'imap-fast-trash-patch' => 'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2+deb7u1/features/imap_fast_trash',
      'purge-message-patch' => 'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2+deb7u1/features/purge-message',
      'short-mailbox-patch' => 'https://raw.github.com/djl/mutt-patches/master/short-mailbox.diff',
      'trash-patch' => 'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2+deb7u1/features/trash-folder',
    }
    p = []
    urls.each do |k, v|
      p << v if build.include? k
    end
    return p
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

