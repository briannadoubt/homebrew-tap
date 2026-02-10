class Raven < Formula
  desc "SwiftUI to DOM cross-compiler"
  homepage "https://github.com/briannadoubt/Raven"
  url "https://github.com/briannadoubt/Raven/archive/refs/tags/0.11.1.tar.gz"
  sha256 "9aca3e0442fb045d97cb6075886af2ace73045b1774742a6917b539b320e2630"
  version "0.11.1"
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
