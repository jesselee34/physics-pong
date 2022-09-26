# Love 2d Boilerplate

## Setup and Run

```bash
# Install love2d
brew install love

# Install dependencies
git submodule init
git submodule update

# Copy deps into the correct place

# Example
# cp -r lib/sti/sti src/modules/sti

# Run game
love src

# Setup and run tests
brew install luarocks
luarocks intall busted

busted tests
```
