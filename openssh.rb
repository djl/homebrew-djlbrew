require 'formula'

class Openssh < Formula
  homepage 'http://www.openssh.com/'
  url 'http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.7p1.tar.gz'
  version '6.7p1'
  sha256 'b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507'

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
