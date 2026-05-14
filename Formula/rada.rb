class Rada < Formula
  desc "Minimal CLI for Apple on-device AI models"
  homepage "https://github.com/kszakharov/rada"
  url "https://github.com/kszakharov/rada/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bf3549cd6a34a9b714ed60a4f781aa0dec6c2473620e7599d067bcfb958ff9d4"
  license "MIT"
  head "https://github.com/kszakharov/rada.git", branch: "main"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/rada"
  end
end
