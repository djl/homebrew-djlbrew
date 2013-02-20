require 'formula'

class Mutt < Formula
  url 'ftp://ftp.mutt.org/mutt/devel/mutt-1.5.21.tar.gz'
  homepage 'http://www.mutt.org/'
  sha1 'a8475f2618ce5d5d33bff85c0affdf21ab1d76b9'

  depends_on 'tokyo-cabinet'
  depends_on 'slang' if build.include? 'with-slang'

  option 'imap-fast-trash-patch', 'Apply the IMAP fast trash patch'
  option 'purge-message-patch', 'Apply the purge message patch (requires trash patch)'
  option 'sidebar-patch', 'Apply the sidebar patch'
  option 'trash-patch', 'Apply the trash folder patch'
  option 'with-slang', 'Build against slang instead of ncurses'

  def patches
    urls = {
      'imap-fast-trash-patch' => 'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2/features/imap_fast_trash',
      'purge-message-patch' => 'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2/features/purge-message',
      'sidebar-patch' => 'http://lunar-linux.org/~tchan/mutt/patch-1.5.21.sidebar.20120829.txt',
      'trash-patch' => 'http://patch-tracker.debian.org/patch/series/dl/mutt/1.5.21-6.2/features/trash-folder',
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

