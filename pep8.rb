require 'formula'

class Pep8 < Formula
  url 'https://github.com/jcrocholl/pep8/archive/1.5.7.tar.gz'
  homepage 'https://github.com/jcrocholl/pep8/'
  sha1 '1687e5e28bdd123cc37614ab3c444fc821aec726'

  def install
    bin.install 'pep8.py' => 'pep8'
  end
end
