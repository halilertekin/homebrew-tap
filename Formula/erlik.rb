class Erlik < Formula
  desc "Apple Silicon (ARM64) Native Activity & Focus Intelligence Tracker for macOS"
  homepage "https://github.com/halilertekin/erlik"
  url "https://github.com/halilertekin/erlik/archive/refs/tags/v3.3.1.tar.gz"
  sha256 "ddee04f3d007b45f23ff158b350e56cb898357fc071fc515e17cc40fac0e64f8"
  license "MIT"
  head "https://github.com/halilertekin/erlik.git", branch: "main"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "node"

  def install
    system "swiftc", "-O", "-target", "arm64-apple-macos12.0", "erlik_unified.swift", "-o", "erlik-app", "-lsqlite3"
    
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/erlik-cli.js" => "erlik"
  end

  def caveats
    <<~EOS
      🐺 ERLİK v3.3 kuruldu!
      Başlatmak için:
        erlik start
      Durdurmak için:
        erlik stop
      Durum kontrolü:
        erlik status
      
      Web Paneli: http://localhost:5757
    EOS
  end

  test do
    system "#{bin}/erlik", "status"
  end
end
