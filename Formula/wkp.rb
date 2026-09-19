class Wkp < Formula
  desc "Durable, cross-machine, cross-harness memory store for AI coding agents"
  homepage "https://github.com/agent-wkp/wkp"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/agent-wkp/wkp/releases/download/v1.1.1/wkp-aarch64-apple-darwin"
      sha256 "3c57998035beb7352d6ca112f2a10e713cdb7841acdd8ef7f21062710b821b56"
    end
    on_intel do
      odie "wkp does not yet publish an x86_64 macOS binary -- see " \
           "github.com/agent-wkp/wkp's docs/plan/milestones.md, " \
           "M6 task 3's own note on the release build matrix."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agent-wkp/wkp/releases/download/v1.1.1/wkp-x86_64-unknown-linux-musl"
      sha256 "2a2c3527ba4b8279bc1169718d8fa0417efcb4ff60d338772ce04c4ab9cec2cc"
    end
    on_arm do
      odie "wkp does not yet publish an aarch64 Linux binary -- see " \
           "github.com/agent-wkp/wkp's docs/plan/milestones.md, " \
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
