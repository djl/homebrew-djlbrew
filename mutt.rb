require 'formula'

class Mutt < Formula
  url 'ftp://ftp.mutt.org/mutt/devel/mutt-1.5.21.tar.gz'
  homepage 'http://www.mutt.org/'
  sha1 'a8475f2618ce5d5d33bff85c0affdf21ab1d76b9'

  depends_on 'tokyo-cabinet'
  depends_on 'slang' if build.include? 'with-slang'

  option 'imap-fast-trash-patch', 'Apply the IMAP fast trash patch'
  option 'purge-message-patch', 'Apply the purge message patch (requires trash patch)'
  option 'quiet-source-patch', 'Apply the quiet source patch'
  option 'short-mailbox-patch', 'Apply the short mailbox name patch'
  option 'sourcex-patch', 'Apply the sourcex patch'
  option 'trash-patch', 'Apply trash folder patch'
  option 'with-slang', 'Build against slang instead of ncurses'

  def patches
    urls = {
      'imap-fast-trash-patch' => 'https://raw.github.com/djl/mutt-patches/master/imap-fast-trash.diff',
      'purge-message-patch' => 'https://raw.github.com/djl/mutt-patches/master/purge-message.diff',
      'quiet-source-patch' => 'https://raw.github.com/djl/mutt-patches/master/quiet-source.diff',
      'short-mailbox-patch' => 'https://raw.github.com/djl/mutt-patches/master/short-mailbox.diff',
      'sourcex-patch' => 'https://raw.github.com/djl/mutt-patches/master/sourcex.diff',
      'trash-patch' => 'https://raw.github.com/djl/mutt-patches/master/trash-folder.diff',
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

