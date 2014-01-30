require 'formula'

class Kpex < Formula
  url 'https://s3.amazonaws.com/djl.homebrew/kpex-2014-01-31'
  homepage 'http://www.keepassx.org/'
  version '2014-01-31'
  sha1 'ffabb45b5c1c020e9e9d7a9d89405a4ac2abe538'

  def install
    bin.install 'kpex-2014-01-31' => 'kpex'
  end
end

