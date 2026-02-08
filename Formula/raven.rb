class Raven < Formula
  desc "SwiftUI to DOM cross-compiler"
  homepage "https://github.com/briannadoubt/Raven"
  url "https://github.com/briannadoubt/Raven/archive/refs/tags/0.10.1.tar.gz"
  sha256 "2a8e966265fe6ae4921ac50ec4fd031fb95fc4ea9c4349d2c90dc34750cd297f"
  version "0.10.1"
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
