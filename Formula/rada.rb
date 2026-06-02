class Rada < Formula
  desc "Minimal CLI for Apple on-device AI models"
  homepage "https://github.com/kszakharov/rada"
  url "https://github.com/kszakharov/rada/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "888e551b2076a10ae93e41a9108e3f7accae32aab5a86616ec6a7c770b76dbbc"
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
