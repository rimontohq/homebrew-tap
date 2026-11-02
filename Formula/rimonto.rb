# The Rimonto CLI (rimontohq/rm-cli), installed from the package attached to its GitHub release.
class Rimonto < Formula
  desc "Repair shop's Rimonto API from a terminal"
  homepage "https://developers.rimonto.app/cli/"
  url "https://github.com/rimontohq/rm-cli/releases/download/v0.1.3/rimonto-0.1.3.tgz"
  sha256 "785108c036b6cb17c8eec54138efdde160f613a020b0e01790c00654d01b2443"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"dist/rimonto.js"
    (bin/"rimonto").write_env_script libexec/"dist/rimonto.js", PATH: "#{formula_opt_bin("node")}:$PATH"
  end

  test do
    assert_match "rimonto #{version}", shell_output("#{bin}/rimonto --version")
    assert_match "tickets", shell_output("#{bin}/rimonto --help")
  end
end
