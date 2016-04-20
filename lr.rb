require 'formula'

class Lr < Formula
  url 'https://github.com/chneukirchen/lr/archive/v0.3.1.tar.gz'
  homepage 'https://github.com/chneukirchen/lr'
  sha256 '61835e16d2b6ae10cb69701d2d5364dee1400cc905b26ff35287df0f39db06ff'

  def install
    system 'make'
    bin.install 'lr'
  end
end
