# Homebrew Tap for kilar

This repository contains the Homebrew formula for [kilar](https://github.com/polidog/kilar), a powerful CLI tool for managing port processes.

## Installation

```bash
# Add the tap
brew tap polidog/kilar

# Install kilar
brew install kilar
```

Or install directly:

```bash
brew install polidog/kilar/kilar
```

## Updating

```bash
brew update
brew upgrade kilar
```

## Uninstallation

```bash
brew uninstall kilar
brew untap polidog/kilar  # Optional: remove the tap
```

## Formula Structure

This tap repository should have the following structure:

```
homebrew-kilar/
├── README.md
└── Formula/
    └── kilar.rb
```

## Setting up the tap repository

1. Create a new GitHub repository named `homebrew-kilar`
2. Copy the `Formula` directory from the main kilar repository
3. Push to GitHub

```bash
# Create new repository on GitHub named "homebrew-kilar"
git clone https://github.com/polidog/homebrew-kilar.git
cd homebrew-kilar

# Copy Formula directory from kilar repo
cp -r ../kilar/Formula .
cp ../kilar/homebrew-tap-README.md README.md

# Commit and push
git add .
git commit -m "Initial tap setup for kilar"
git push origin main
```

## Maintenance

The formula is automatically updated when a new release is published in the main kilar repository through GitHub Actions.

## License

MIT License - See [LICENSE](https://github.com/polidog/kilar/blob/main/LICENSE) in the main repository.