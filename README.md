# Homebrew Tools

Personal/non-official formulas/casks.

- Casks
  - [dockutil][personal-dockutil-cask] (Deprecated! Please use the available [formula][dockutil-formula] instead!)
- Formulas
  - [sphynx][sphynx]
  - [twitter-cleaner][twitter-cleaner]

### Testing formulas/casks

The following command(s) can be used to test changes for a new formula or when
editing an existing one:

```bash
♪ brew install --build-from-source <path>

# or

♪ brew edit <formula> && brew install <formula>
```

Also, it's possible to use the following command to check a formula for Homebrew
coding style violations:

```bash
♪ brew audit <formula>
```

### References

- [Formula Cookbook][docs-formula-cookbook]



[personal-dockutil-cask]: https://github.com/kcrawford/dockutil
[dockutil-formula]: https://github.com/Homebrew/homebrew-core/blob/d6f2f04b025d67eeaea800a070b669d23bae549c/Formula/d/dockutil.rb
[sphynx]: https://github.com/hpedrorodrigues/sphynx
[twitter-cleaner]: https://github.com/hpedrorodrigues/twitter-cleaner
[docs-formula-cookbook]: https://docs.brew.sh/Formula-Cookbook
