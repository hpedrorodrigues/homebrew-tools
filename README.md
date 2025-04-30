# Homebrew Tools

Personal/non-official formulas/casks.

- Formulas
  - [kubectl-ai]
  - [sphynx]
  - [twitter-cleaner]

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

- [Formula Cookbook]

[kubectl-ai]: https://github.com/GoogleCloudPlatform/kubectl-ai
[sphynx]: https://github.com/hpedrorodrigues/sphynx
[twitter-cleaner]: https://github.com/hpedrorodrigues/twitter-cleaner
[Formula Cookbook]: https://docs.brew.sh/Formula-Cookbook
