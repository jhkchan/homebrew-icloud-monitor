class IcloudMonitor < Formula
  desc "Terminal-based monitoring tool for macOS iCloud Drive"
  homepage "https://github.com/jhkchan/icloud-monitor"
  url "https://github.com/jhkchan/icloud-monitor/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "82530919097ba3d4ee990602b99d89a41f479743f186dedc2d25a12b2e75b0b1"
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
