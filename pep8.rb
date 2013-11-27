require 'formula'

class Pep8 < Formula
  url 'https://github.com/jcrocholl/pep8/archive/1.4.6.tar.gz'
  homepage 'https://github.com/jcrocholl/pep8/'
  sha1 '11c34672a2f5df94d1f1da3863e1aebda4feaa91'

  def install
    bin.install 'pep8.py' => 'pep8'
  end
end
