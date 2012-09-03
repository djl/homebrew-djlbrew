require 'formula'

class Darcs < Formula
  homepage 'http://www.gnu.org/software/findutils/'
  url 'http://darcs.net/binaries/macosx/darcs-2.5-OSX-10.6-i386.tar.gz'
  version '2.5'
  sha1 'b7c10929952d06c3d3a38dd7ca166b0742ad3706'

  def install
    bin.install "darcs"
  end
end
