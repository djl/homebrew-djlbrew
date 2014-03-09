require 'formula'

class KdbxExtract < Formula
  url 'https://s3.amazonaws.com/djl.homebrew/kdbx-extract-2.0-alpha5'
  homepage 'https://github.com/djl/keepassx/tree/kdbx-extract-prompt'
  version '2.0-alpha5'
  sha1 '6f5c5628dcae57581eddbf9e18e6efa5aa35ce5f'

  def install
    bin.install 'kdbx-extract-2.0-alpha5' => 'kdbx-extract'
  end

  def caveats; <<-EOS.undent
    This is a custom built version of the kdbx-extract utility. It
    will prompt for a passphrase rather than require one be given
    on the command line.
    EOS
  end
end

