# Rimonto's Homebrew tap

```sh
brew install rimontohq/tap/rimonto
```

`rimonto` is a repair shop's Rimonto API from a terminal: [rimontohq/rm-cli](https://github.com/rimontohq/rm-cli),
documented at https://developers.rimonto.app/cli/.

A new release of the CLI needs nothing here: `.woodpecker/bump.yaml` (the Woodpecker cron `bump`, every hour) sees
npm's newer `rimonto`, points `url` and `sha256` at that release's package, audits, installs and tests it, then pushes
the change to `dev`. By hand it is the same edit, `brew install --build-from-source ./Formula/rimonto.rb` and
`brew test rimonto` before pushing.

## Checks

Woodpecker (`.woodpecker/check.yaml`) runs on every pull request, every push to `dev` and every night (its cron job
`nightly`): `brew audit --strict --online`, `brew install` and `brew test` in Homebrew's own image, then that npm's
latest `rimonto` is the formula's version and runs. `scripts/lint-ops.mjs` lints the pipelines there too
(`woodpecker-cli lint --strict`, a warning fails; shellcheck and hadolint for a shell script or a Dockerfile, once there
is one): `node scripts/lint-ops.mjs` runs it here, with the linters installed (`brew install woodpecker-cli shellcheck
hadolint`), and `node --test scripts/lint-ops.test.mjs` its tests.
