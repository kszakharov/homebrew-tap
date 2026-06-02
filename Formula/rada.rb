class Rada < Formula
  desc "Minimal CLI for Apple on-device AI models"
  homepage "https://github.com/kszakharov/rada"
  url "https://github.com/kszakharov/rada/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "ded05498fbbd031e3e534f896cf24620ddacde1942b67561ddc175d3f88183cb"
  license "MIT"
  head "https://github.com/kszakharov/rada.git", branch: "main"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    system "make", "set-version", "VERSION=#{version}"
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/rada"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rada --version")
  end
end
