class Rada < Formula
  desc "Minimal CLI for Apple on-device AI models"
  homepage "https://github.com/kszakharov/rada"
  url "https://github.com/kszakharov/rada/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a66eecb2fc936db8fa5b769d2465a94e47859f8c2db0e206b1e8796fb6cd0387"
  license "MIT"
  head "https://github.com/kszakharov/rada.git", branch: "main"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/rada"
  end
end
