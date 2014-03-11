require 'formula'

class KdbxExtract < Formula
  version '2014-03-11'
  url "https://s3.amazonaws.com/djl.homebrew/kdbx-extract-#{version}"
  homepage 'https://github.com/djl/keepassx/tree/kdbx-extract-prompt'
  sha1 '9b9d131dd13a05e0c65838be7fa1a705132dcb10'

  def install
    bin.install "kdbx-extract-#{version}" => 'kdbx-extract'
  end

  def caveats; <<-EOS.undent
    This is a custom built version of the kdbx-extract utility. It
    will prompt for a passphrase rather than require one be given
    on the command line.
    EOS
  end
end

