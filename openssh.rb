require 'formula'

class Openssh < Formula
  homepage 'http://www.openssh.com/'
  url 'http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.8p1.tar.gz'
  version '6.8p1'
  sha256 '3ff64ce73ee124480b5bf767b9830d7d3c03bbcb6abe716b78f0192c37ce160e'

  depends_on 'openssl'

  patch :p0 do
    url 'https://raw.githubusercontent.com/voidlinux/void-packages/57703a9c08620b4e680439902db5ad797bd47785/srcpkgs/openssh/files/openssh-6.8p1-identitypersist.patch'
    sha256 '0382e2c8a82e9363dc2eed0150d94f5207d9f71de01f5691717d7a5976f32f5a'
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
