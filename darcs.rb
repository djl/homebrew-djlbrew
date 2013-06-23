require 'formula'

class Darcs < Formula
  homepage 'http://darcs.net/'
  url 'http://darcs.net/binaries/macosx/darcs-2.8.4-OSX-10.8.4-x86_64.tar.bz2'
  version '2.8.4'
  sha1 'c89fb8cf68ef7f9f61e3ad1a7514236c2cdb437d'

  def install
    bin.install "darcs"
  end
end
