require 'formula'

class Openssh < Formula
  homepage 'http://www.openssh.com/'
  url 'http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.6p1.tar.gz'
  version '6.6p1'
  sha256 '48c1f0664b4534875038004cc4f3555b8329c2a81c1df48db5c517800de203bb'

  depends_on 'openssl'

  def patches
    ['https://raw.githubusercontent.com/djl/openssh-patches/master/openssh-6.4p1-identitypersist.patch']
  end

  def install
    args = [
      "--with-libedit",
      "--with-kerberos5",
      "--prefix=#{prefix}",
      "--sysconfdir=#{etc}/ssh",
      "--with-ssl-dir=#{Formula["openssl"].opt_prefix}",
    ]

    system "./configure", *args
    system "make"
    system "make install"
  end
end
