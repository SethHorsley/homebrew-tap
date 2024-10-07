class Gee < Formula
  desc "GitHub binary installer"
  homepage "https://github.com/SethHorsley/gee"
  version "0.1.0"
  license "MIT" # Replace with your actual license if different

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SethHorsley/gee/releases/download/v#{version}/gee-darwin-arm64"
      sha256 "abc123..." # Replace with actual SHA256 for ARM binary
    else
      url "https://github.com/SethHorsley/gee/releases/download/v#{version}/gee-darwin-x86_64"
      sha256 "def456..." # Replace with actual SHA256 for Intel binary
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SethHorsley/gee/releases/download/v#{version}/gee-linux-x86_64"
      sha256 "ghi789..." # Replace with actual SHA256 for Linux binary
    end
  end

  def install
    binary_name = "gee"
    on_macos do
      binary_name += if Hardware::CPU.arm?
        "-darwin-arm64"
      else
        "-darwin-x86_64"
      end
    end
    on_linux do
      binary_name += "-linux-x86_64"
    end
    bin.install binary_name => "gee"
  end

  test do
    assert_match "gee version #{version}", shell_output("#{bin}/gee --version")
  end
end
