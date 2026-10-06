class Erlik < Formula
  desc "Apple Silicon (ARM64) Native Activity & Focus Intelligence Tracker for macOS"
  homepage "https://github.com/halilertekin/erlik"
  version "3.5.12"
  url "https://github.com/halilertekin/erlik/archive/refs/tags/v3.5.12.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
