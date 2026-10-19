class Erlik < Formula
  desc "Apple Silicon native activity, focus & AI-agent time tracker for macOS"
  homepage "https://erlik.be"
  url "https://github.com/halilertekin/erlik-releases/releases/download/v3.5.31/erlik-3.5.31-macos-arm64.tar.gz"
  sha256 "40020900795eca3d4c08f8c2f25fee98dac2607fe31bf064c9f16be06afc3f2d"
  version "3.5.31"
  # Eski istemcilerin güncelleme kontrolü bu satırı okur — kaldırma:
  # tag:      "v3.5.31"

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
      🐺 ERLİK v3.5.31 kuruldu!
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
