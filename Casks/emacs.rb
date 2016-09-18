cask 'emacs' do
  name 'Emacs'
  homepage 'https://emacsformacosx.com/'
  version '25.1'
  url "https://emacsformacosx.com/emacs-builds/Emacs-#{version}-universal.dmg"
  sha256 '5bd04c82d2a091a48d7b9b80a26fa31f64767f2e553440a556d12be5815e29ef'
  license :gpl
  app 'Emacs.app'
end
