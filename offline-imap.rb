require 'formula'

class OfflineImap < Formula
  homepage 'http://offlineimap.org/'
  url 'https://github.com/spaetz/offlineimap/tarball/v6.5.3.1'
  md5 '40a631fe164c74bb92933a1e683a10a1'

  def install
    libexec.install 'bin/offlineimap' => 'offlineimap.py'
    libexec.install 'offlineimap'
    prefix.install [ 'offlineimap.conf', 'offlineimap.conf.minimal' ]
    bin.mkpath
    ln_s libexec+'offlineimap.py', bin+'offlineimap'
  end
end

