class Unlocker < Formula
  desc "Tool to enforce Swift style and conventions"
  homepage "https://github.com/mat1th/unlocker"
  url "https://github.com/mat1th/unlocker/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "64828d2e2d908807f8212c03f15cbe9730c08793c82f735451842b1bf2d3e334"
  license "GPL-2.0-or-later"
  head "https://github.com/mat1th/unlocker.git", branch: "master"

  depends_on xcode: ["13.0", :build]
  depends_on xcode: "8.0"

  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/unlocker"
  end

  test do
    system "unlocker", "--help"
  end
end
