require 'formula'

class Mutt < Formula
  url 'ftp://ftp.mutt.org/mutt/devel/mutt-1.5.21.tar.gz'
  homepage 'http://www.mutt.org/'
  md5 'a29db8f1d51e2f10c070bf88e8a553fd'

  depends_on 'tokyo-cabinet'
  depends_on 'slang' if ARGV.include? '--with-slang'

  def options
    [
      ['--enable-debug', "Build with debug option enabled"],
      ['--trash-patch', "Apply trash folder patch"],
      ['--mailbox-alias-patch', "Apply mailbox alias patch"],
      ['--with-slang', "Build against slang instead of ncurses"],
    ]
  end

  def patches
    urls = [
      ['--trash-patch', 'https://gist.github.com/raw/1361946/632541cf9ae54e3d1caed5c748149962f8972c28/mutt-trash-folder.patch'],
      ['--mailbox-alias-patch', 'https://gist.github.com/raw/1361945/498a4b8715a5c4508f62f110ced6447045ce9a6c/mutt_mbox_alias.patch'],
    ]

    p = []
    urls.each do |u|
      p << u[1] if ARGV.include? u[0]
    end
    return p
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
    system "./configure", *args
    system "make install"
  end
end

