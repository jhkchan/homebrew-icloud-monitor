class IcloudMonitor < Formula
  desc "Terminal-based monitoring tool for macOS iCloud Drive"
  homepage "https://github.com/jhkchan/icloud-monitor"
  url "https://github.com/jhkchan/icloud-monitor/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5f63c4130231457b4ca18c370f1e03f821c9b7c31af17cb3ff67dc6afc516dca"
  license "MIT"

  depends_on "node"
  depends_on :macos

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "iCloud Drive Status", shell_output("#{bin}/icloud-monitor status 2>&1")
  end
end
