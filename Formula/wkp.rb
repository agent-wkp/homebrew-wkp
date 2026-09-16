class Wkp < Formula
  desc "Durable, cross-machine, cross-harness memory store for AI coding agents"
  homepage "https://github.com/williamcaban/agent-wkp"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/williamcaban/agent-wkp/releases/download/v1.0.2/wkp-aarch64-apple-darwin"
      sha256 "67cc25626962eccf28bd87b84b0af5ac55591b8f472570a7b95c833877ef66ec"
    end
    on_intel do
      odie "wkp does not yet publish an x86_64 macOS binary -- see " \
           "github.com/williamcaban/agent-wkp's docs/plan/milestones.md, " \
           "M6 task 3's own note on the release build matrix."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/williamcaban/agent-wkp/releases/download/v1.0.2/wkp-x86_64-unknown-linux-musl"
      sha256 "875f77dd94e30ddd8022852d71fe24883de3a843f1d31f6c1b0732619745e604"
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
