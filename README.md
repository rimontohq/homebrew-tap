# Rimonto's Homebrew tap

```sh
brew install rimontohq/tap/rimonto
```

`rimonto` is a repair shop's Rimonto API from a terminal: [rimontohq/rm-cli](https://github.com/rimontohq/rm-cli),
documented at https://developers.rimonto.app/cli/.

A new release of the CLI: point `url` and `sha256` in `Formula/rimonto.rb` at the package attached to its GitHub
release (`shasum -a 256 rimonto-<version>.tgz`), then `brew install --build-from-source ./Formula/rimonto.rb` and
`brew test rimonto` before pushing.

## Checks

Woodpecker (`.woodpecker/check.yaml`) runs on every pull request, every push to `dev` and every night (its cron job
`nightly`): `brew audit --strict --online`, `brew install` and `brew test` in Homebrew's own image, then that npm's
latest `rimonto` is the formula's version and runs.
