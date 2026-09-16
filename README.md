# homebrew-wkp

Homebrew tap for [`wkp`](https://github.com/williamcaban/agent-wkp), the
Rust rewrite of `agent-wkp` -- durable, cross-machine, cross-harness
memory for AI coding agents.

## Install

```
brew install williamcaban/wkp/wkp
```

or tap first, then install:

```
brew tap williamcaban/wkp
brew install wkp
```

## Supported platforms

- macOS (Apple Silicon / arm64)
- Linux (x86_64)

macOS Intel and Linux arm64 binaries aren't published yet -- see
[agent-wkp's own build-matrix notes](https://github.com/williamcaban/agent-wkp/blob/main/docs/plan/milestones.md)
for why (the Linux arm64 target's cross-compilation toolchain isn't
currently producing reproducible builds).

## Upgrade

```
brew upgrade wkp
```

## Formula

[`Formula/wkp.rb`](Formula/wkp.rb) points at signed release binaries
from [agent-wkp's GitHub Releases](https://github.com/williamcaban/agent-wkp/releases),
verified by SHA-256 checksum. Every release is also cosign-signed
(keyless, Fulcio + Rekor) with SLSA Build L3 provenance -- see the
release notes for verification instructions.
