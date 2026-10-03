class Wkp < Formula
  desc "Durable, cross-machine, cross-harness memory store for AI coding agents"
  homepage "https://github.com/agent-wkp/wkp"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/agent-wkp/wkp/releases/download/v1.2.0/wkp-aarch64-apple-darwin"
      sha256 "5db0cb593487a462bba7e3a32338f7c76655bae2f2f3eaf945210601bf16e8e1"
    end
    on_intel do
      odie "wkp does not yet publish an x86_64 macOS binary -- see " \
           "github.com/agent-wkp/wkp's docs/plan/milestones.md, " \
           "M6 task 3's own note on the release build matrix."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agent-wkp/wkp/releases/download/v1.2.0/wkp-x86_64-unknown-linux-musl"
      sha256 "2d5e5c0cb083676a7d2415bea18eb6c02e402d2f24a000ccc05a229c180e72f1"
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
