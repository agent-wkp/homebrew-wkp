class Wkp < Formula
  desc "Durable, cross-machine, cross-harness memory store for AI coding agents"
  homepage "https://github.com/agent-wkp/wkp"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/agent-wkp/wkp/releases/download/v1.1.0/wkp-aarch64-apple-darwin"
      sha256 "ee959e22a730f6f0eb2f94a16cae18c247f0cbbcf61e5bf72d29306b8601e810"
    end
    on_intel do
      odie "wkp does not yet publish an x86_64 macOS binary -- see " \
           "github.com/agent-wkp/wkp's docs/plan/milestones.md, " \
           "M6 task 3's own note on the release build matrix."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agent-wkp/wkp/releases/download/v1.1.0/wkp-x86_64-unknown-linux-musl"
      sha256 "83cb71f436965e3e9f77d2d3c8a688c79fee47a03e81f500ec49ebc52c97f0c5"
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
