# The Rimonto CLI (rimontohq/rm-cli), installed from the package attached to its GitHub release.
class Rimonto < Formula
  desc "Repair shop's Rimonto API from a terminal"
  homepage "https://developers.rimonto.app/cli/"
  url "https://github.com/rimontohq/rm-cli/releases/download/v0.1.0/rimonto-0.1.0.tgz"
  sha256 "3db2a0afa1d0581bc06588ace021e9e2697f02a406d80d7d74cd6d72e10090b0"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"rimonto").write_env_script Formula["node"].opt_bin/"node", libexec/"dist/rimonto.js", {}
  end

  test do
    assert_match "rimonto #{version}", shell_output("#{bin}/rimonto --version")
    assert_match "tickets", shell_output("#{bin}/rimonto --help")
  end
end
