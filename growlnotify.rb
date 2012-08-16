require 'formula'

class Growlnotify < Formula
  url 'https://s3.amazonaws.com/djl.homebrew/growlnotify-v1.3.tar.gz'
  md5 '44f771b0bafd0fc077ecc546841d9831'

  homepage 'http://growl.info/extras.php#growlnotify'

  def install
    bin.install "growlnotify"
    man1.install gzip("growlnotify.1")
  end
end
