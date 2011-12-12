require 'formula'

class OfflineImap < Formula
  url "https://github.com/spaetz/offlineimap.git", :tag => 'v6.4.2'
  version '6.4.2'
  homepage "http://offlineimap.org/"

  def install
    libexec.install 'bin/offlineimap' => 'offlineimap.py'
    libexec.install 'offlineimap'
    prefix.install [ 'offlineimap.conf', 'offlineimap.conf.minimal' ]
    bin.mkpath
    ln_s libexec+'offlineimap.py', bin+'offlineimap'
  end
end

