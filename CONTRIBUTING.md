# Adding Formulae to This Tap

This tap hosts multiple CLI tools. Here's how to add a new one.

## Quick Add

```bash
cd homebrew-tap

# Create new formula (replace 'newtool' with your tool name)
cat > Formula/newtool.rb << 'FORMULA'
class Newtool < Formula
  desc "Description of your tool"
  homepage "https://github.com/briannadoubt/newtool"
  url "https://github.com/briannadoubt/newtool/archive/refs/tags/0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"
  
  depends_on "swift" => :build
  depends_on xcode: ["15.0", :build]
  
  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/newtool"
  end
  
  test do
    system "#{bin}/newtool", "--version"
  end
end
FORMULA
```

## Getting SHA256

```bash
curl -L https://github.com/briannadoubt/newtool/archive/refs/tags/0.1.0.tar.gz | shasum -a 256
```

## Testing

```bash
brew install --build-from-source ./Formula/newtool.rb
brew uninstall newtool
```

## Users Install

```bash
brew tap briannadoubt/tap
brew install newtool
```
