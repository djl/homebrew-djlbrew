require 'formula'

class Lr < Formula
  url 'https://github.com/chneukirchen/lr/archive/v0.3.2.tar.gz'
  homepage 'https://github.com/chneukirchen/lr'
  sha256 'c4fb7183c0068708cb57078a83ea3ec254cbebeedcd87650dc39a077aaa88599'

  def install
    system 'make'
    bin.install 'lr'
  end
end
