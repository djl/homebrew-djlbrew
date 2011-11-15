require 'formula'

class Growlnotify < Formula
  if RUBY_PLATFORM =~ /darwin11/
    url 'https://s3.amazonaws.com/djl.homebrew/growlnotify-v1.3.tar.gz'
    md5 '44f771b0bafd0fc077ecc546841d9831'
  else
    url 'https://s3.amazonaws.com/djl.homebrew/growlnotify-v1.2.2.tar.gz'
    md5 'cfe9a988a0a64aba128baf363050b434'
  end

  homepage 'http://growl.info/extras.php#growlnotify'

  def install
    bin.install "growlnotify"
    man1.install gzip("growlnotify.1")
  end
end
