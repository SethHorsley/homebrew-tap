class AiTools < Formula
  desc "GitHub binary installer"
  homepage "https://github.com/SethHorsley/ai-tools"
  version "0.1.0"
  if Hardware::CPU.arm?
    url "https://github.com/SethHorsley/ai-tools/releases/download/v#{version}/agg-files-darwin-arm64"
    sha256 "abc123..." # Replace with actual SHA256 for ARM binary
  else
    url "https://github.com/SethHorsley/ai-tools/releases/download/v#{version}/agg-files-darwin-x86_64"
    sha256 "def456..." # Replace with actual SHA256 for Intel binary
  end

  def install
    bin.install "agg-files-darwin-#{Hardware::CPU.arm? ? "arm64" : "x86_64"}" => "ai-tools"
  end

  test do
    system "#{bin}/agg-files", "--version"
  end
end
