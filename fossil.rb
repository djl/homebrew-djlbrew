require 'formula'

class Fossil < Formula
  homepage 'http://www.fossil-scm.org/'
  url 'http://www.fossil-scm.org/download/fossil-macosx-x86-20121022124804.zip'
  version '1.24'
  sha1 'adf8b5bc552afc820b0a576f6fe410e6858365f2'

  def install
    bin.install 'fossil'
  end
end
