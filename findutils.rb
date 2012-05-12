require 'formula'

class Findutils < Formula
  url 'http://ftpmirror.gnu.org/findutils/findutils-4.4.2.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/findutils/findutils-4.4.2.tar.gz'
  homepage 'http://www.gnu.org/software/findutils/'
  md5 '351cc4adb07d54877fa15f75fb77d39f'

  def install
    system "./configure --prefix=#{prefix} --disable-debug --disable-dependency-tracking"
    system "make install"
  end
end