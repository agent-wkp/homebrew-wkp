class Wkp < Formula
  desc "Durable, cross-machine, cross-harness memory store for AI coding agents"
  homepage "https://github.com/agent-wkp/wkp"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/agent-wkp/wkp/releases/download/v1.1.2/wkp-aarch64-apple-darwin"
      sha256 "c834d2dc93b1a3108d1d9126243f4e581104cf90afc1c458942e38a66ce7b0b8"
    end
    on_intel do
      odie "wkp does not yet publish an x86_64 macOS binary -- see " \
           "github.com/agent-wkp/wkp's docs/plan/milestones.md, " \
           "M6 task 3's own note on the release build matrix."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agent-wkp/wkp/releases/download/v1.1.2/wkp-x86_64-unknown-linux-musl"
      sha256 "a8d22f8f2e10406e458d88a92d3c07867f242cec4251261619758529b84ad4e6"
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
