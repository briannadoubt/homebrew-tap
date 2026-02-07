class Raven < Formula
  desc "SwiftUI to DOM cross-compiler"
  homepage "https://github.com/briannadoubt/Raven"
  url "https://github.com/briannadoubt/Raven.git", branch: "main"
  version "0.10.0"
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
