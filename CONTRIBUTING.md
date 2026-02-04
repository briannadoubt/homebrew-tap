# Adding Formulae to This Tap

This tap hosts multiple CLI tools. Here's how to add a new one.

## Quick Add

```bash
cd homebrew-tap

# Create new formula
cat > Formula/newtool.rb << 'FORMULA'
class Newtool < Formula
  desc "Description of your tool"
  homepage "https://github.com/briannadoubt/newtool"
  url "https://github.com/briannadoubt/newtool/archive/refs/tags/0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  
  depends_on "swift" => :build
  depends_on xcode: ["15.0", :build]
  depends_on :macos => :sequoia
  
  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/newtool"
  end
  
  test do
    system "#{bin}/newtool", "--version"
  end
end
FORMULA

# Update README
# Add to the Available Formulae section

# Commit
git add Formula/newtool.rb README.md
git commit -m "Add newtool formula"
git push
```

## Formula Template

Use this template for Swift CLI tools:

```ruby
class Toolname < Formula
  desc "Short description"
  homepage "https://github.com/briannadoubt/toolname"
  url "https://github.com/briannadoubt/toolname/archive/refs/tags/VERSION.tar.gz"
  sha256 "SHA256_HASH"
  license "LICENSE_TYPE"
  
  depends_on "swift" => :build
  depends_on xcode: ["15.0", :build]
  
  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/toolname"
  end
  
  test do
    system "#{bin}/toolname", "--version"
  end
end
```

## Getting SHA256

After creating a GitHub release:

```bash
curl -L https://github.com/briannadoubt/toolname/archive/refs/tags/0.1.0.tar.gz | shasum -a 256
```

## Testing Locally

```bash
brew install --build-from-source ./Formula/toolname.rb
toolname --version
brew uninstall toolname
```

## Audit

```bash
brew audit --strict Formula/toolname.rb
```

## Users Install

Once pushed:

```bash
brew tap briannadoubt/tap  # Only needed once
brew install toolname
```

## Updating Formulae

When releasing a new version:

```bash
# Update version in url and sha256
vim Formula/toolname.rb

# Commit
git add Formula/toolname.rb
git commit -m "Update toolname to v0.2.0"
git push
```

Users update with:
```bash
brew update
brew upgrade toolname
```

## Best Practices

1. **Semantic versioning**: Use proper version tags
2. **Test thoroughly**: Always test locally before pushing
3. **Document well**: Update README with each new tool
4. **Audit clean**: Ensure `brew audit` passes
5. **Stable releases**: Only add stable, tagged releases

## Resources

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Swift Package Formula Example](Formula/compote.rb)
