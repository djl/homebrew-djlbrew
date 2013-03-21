require 'formula'

class Pep8 < Formula
  url 'https://github.com/jcrocholl/pep8/tarball/1.4.5'
  homepage 'https://github.com/jcrocholl/pep8/'
  sha1 '65269a9cc6224295a0bd8fee6864cb05da7da6fd'

  def install
    bin.install 'pep8.py' => 'pep8'
  end
end
