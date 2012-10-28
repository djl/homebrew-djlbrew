require 'formula'

class Pep8 < Formula
  url 'https://github.com/jcrocholl/pep8/tarball/1.3.3'
  homepage 'https://github.com/jcrocholl/pep8/'
  sha1 '37fd2402438a1823b80bb2227c51a16353a0208b'

  def install
    bin.install 'pep8.py' => 'pep8'
  end
end
