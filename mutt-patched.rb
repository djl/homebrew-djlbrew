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

  patch do
    url "https://sources.debian.net/data/main/m/mutt/1.5.24-1/debian/patches/features/trash-folder.patch"
    sha256 "34e318729b1829ea98c171c76de427b8f3ea6e85115639802cec81b4c2167cd0"
  end

  patch do
    url "https://sources.debian.net/data/main/m/mutt/1.5.24-1/debian/patches/features/purge-message.patch"
    sha256 "1b78d96bcc35f620c7e7bc8d1a93b2b24a05d63f90aab25ed1ce0d0f41b00aa6"
  end

  patch do
    url "https://sources.debian.net/data/main/m/mutt/1.5.24-1/debian/patches/features/imap_fast_trash.patch"
    sha256 "f5478b3dfcfe7bb8c43dfb9e74840fd7f740e9be7fc9ef62ea02e6c454d79f3d"
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
