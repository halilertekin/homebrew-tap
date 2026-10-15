class Erlik < Formula
  desc "Apple Silicon native activity, focus & AI-agent time tracker for macOS"
  homepage "https://erlik.be"
  url "https://github.com/halilertekin/erlik-releases/releases/download/v3.5.15/erlik-3.5.15-macos-arm64.tar.gz"
  sha256 "326d99797ec9e5da5dfabfd487b5a7bc42f7697386d21aaf4aaeb9ef19ad61e7"
  version "3.5.15"
  # Eski istemcilerin güncelleme kontrolü bu satırı okur — kaldırma:
  # tag:      "v3.5.15"

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
      🐺 ERLİK v3.5.15 kuruldu!
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
