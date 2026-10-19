class Erlik < Formula
  desc "Apple Silicon native activity, focus & AI-agent time tracker for macOS"
  homepage "https://erlik.be"
  url "https://github.com/halilertekin/erlik-releases/releases/download/v3.7.0/erlik-3.7.0-macos-arm64.tar.gz"
  sha256 "7f33b99f7fda8c6cb44872f2de0f2bf4dca52ae31dbfd46b8a05fd4f9ed8c1e9"
  version "3.7.0"
  # Eski istemcilerin güncelleme kontrolü bu satırı okur — kaldırma:
  # tag:      "v3.7.0"

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
      🐺 ERLİK v3.7.0 kuruldu!
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
