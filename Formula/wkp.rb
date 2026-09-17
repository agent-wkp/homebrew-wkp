class Wkp < Formula
  desc "Durable, cross-machine, cross-harness memory store for AI coding agents"
  homepage "https://github.com/williamcaban/agent-wkp"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/williamcaban/agent-wkp/releases/download/v1.0.3/wkp-aarch64-apple-darwin"
      sha256 "dbb86b52781d1b3a9887bdc2d4961ffd1b69179cfc3efc300430e35afb62fdbd"
    end
    on_intel do
      odie "wkp does not yet publish an x86_64 macOS binary -- see " \
           "github.com/williamcaban/agent-wkp's docs/plan/milestones.md, " \
           "M6 task 3's own note on the release build matrix."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/williamcaban/agent-wkp/releases/download/v1.0.3/wkp-x86_64-unknown-linux-musl"
      sha256 "ff6a9f1b1cacbab81d3152b3abc0d17ada3c022441b5313410d3334132435908"
    end
    on_arm do
      odie "wkp does not yet publish an aarch64 Linux binary -- see " \
           "github.com/williamcaban/agent-wkp's docs/plan/milestones.md, " \
           "M6 task 3's own note on aarch64-unknown-linux-musl's build " \
           "reproducibility gap."
    end
  end

  def install
    binary = Dir["wkp-*"].first
    bin.install binary => "wkp"
    chmod 0755, bin/"wkp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wkp --version")
  end
end
