class Gee < Formula
  desc "GitHub binary installer"
  homepage "https://github.com/SethHorsley/gee"
  version "0.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/SethHorsley/gee/releases/download/v#{version}/gee-darwin-arm64"
    sha256 "abc123..."
  else
    url "https://github.com/SethHorsley/gee/releases/download/v#{version}/gee-darwin-x86_64"
    sha256 "def456..."
  end

  def install
    bin.install "gee-darwin-#{Hardware::CPU.arm? ? "arm64" : "x86_64"}" => "gee"
  end

  test do
    system "#{bin}/gee", "--version"
  end
end
