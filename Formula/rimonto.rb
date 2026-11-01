# The Rimonto CLI (rimontohq/rm-cli), installed from the package attached to its GitHub release.
class Rimonto < Formula
  desc "Repair shop's Rimonto API from a terminal"
  homepage "https://developers.rimonto.app/cli/"
  url "https://github.com/rimontohq/rm-cli/releases/download/v0.1.1/rimonto-0.1.1.tgz"
  sha256 "5f05cb16df7fc612f4d427c517ba0446041fc22884c44e4956eb4e8aa0fde0a3"
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
