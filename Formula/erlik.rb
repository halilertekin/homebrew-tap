class Erlik < Formula
  desc "Apple Silicon native activity, focus & AI-agent time tracker for macOS"
  homepage "https://erlik.be"
  url "https://github.com/halilertekin/erlik-releases/releases/download/v3.8.6/erlik-3.8.6-macos-arm64.tar.gz"
  sha256 "bab3fb42b87b7b062dba41c4b5dcbfae0c65420cd4c7c25050c7d90ba81a1db6"
  version "3.8.6"
  # Eski istemcilerin güncelleme kontrolü bu satırı okur — kaldırma:
  # tag:      "v3.8.6"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "node"

  def install
    # Önceden derlenmiş paket; Pro özellikleri lisans anahtarıyla açılır (Raycast modeli)
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/erlik-cli.js" => "erlik"
  end

  def caveats
    <<~EOS
      🐺 ERLİK v3.8.6 kuruldu!
        erlik start   · erlik stop   · erlik status
        Otomatik başlatma: erlik autostart
      Web Paneli: http://localhost:5757
      Not: Clipboard HUD + AI ajan zekâsı Pro'dur — erlik.be/#pricing
    EOS
  end

  test do
    assert_predicate libexec/"erlik-app", :executable?
  end
end
