require 'formula'

class KdbxExtract < Formula
  url 'https://s3.amazonaws.com/djl.homebrew/kdbx-extract-2.0-alpha5'
  homepage 'http://www.keepassx.org/'
  version '2.0-alpha5'
  sha1 '6f5c5628dcae57581eddbf9e18e6efa5aa35ce5f'

  def install
    bin.install 'kdbx-extract-2.0-alpha5' => 'kdbx-extract'
  end
end

