# Homebrew Tools

Personal/non-official formulas/casks.

### Testing formulas/casks

You can use the following command(s) to test changes for a new formula or when
editing an existing one:

```bash
# brew install --build-from-source <path>
# e.g.,
♪ brew install --build-from-source ./Formula/sphynx.rb

# or
♪ brew edit hpedrorodrigues/tools/sphynx
♪ brew install hpedrorodrigues/tools/sphynx

# you can then check files at /opt/homebrew/Cellar/sphynx/<version>/
```
