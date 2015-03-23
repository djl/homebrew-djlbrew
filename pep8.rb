require 'formula'

class Pep8 < Formula
  url 'https://github.com/jcrocholl/pep8/archive/1.6.2.tar.gz'
  homepage 'https://github.com/jcrocholl/pep8/'
  sha1 '64b57d8e1d884885e6670e4eb969baec610e1742'

  def install
    bin.install 'pep8.py' => 'pep8'
  end
end
