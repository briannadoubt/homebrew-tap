class Raven < Formula
  desc "SwiftUI to DOM cross-compiler"
  homepage "https://github.com/briannadoubt/Raven"
  url "https://github.com/briannadoubt/Raven/archive/refs/tags/0.10.3.tar.gz"
  sha256 "5df106266bbe028bd91204aa3e67f2d1747cb20148487c3b6dcafb2edc18054b"
  version "0.10.3"
  license "Apache-2.0"
  head "https://github.com/briannadoubt/Raven.git", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox", "--product", "raven"
    bin.install ".build/release/raven"
  end

  test do
    system bin/"raven", "--version"
  end
end
