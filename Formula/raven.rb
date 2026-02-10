class Raven < Formula
  desc "SwiftUI to DOM cross-compiler"
  homepage "https://github.com/briannadoubt/Raven"
  url "https://github.com/briannadoubt/Raven/archive/refs/tags/0.11.0.tar.gz"
  sha256 "3b486ec940f0e752c9aa8318bedcc4fef017cdd6c4a7fc5b401bad586840385d"
  version "0.11.0"
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
