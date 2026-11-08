# AGENTS.md - Developer & AI Agent Operations Manual for `win11-kde-plasma` 🤖

This document is the definitive operational guide for autonomous AI coding agents (Antigravity, Claude, Cursor, OpenAI Codex, OpenHands) operating within this repository.

---

## 🎯 1. System Overview & Core Philosophy

**Windows 11 Transformation Suite for KDE Plasma 6 🪟**
> A turnkey, pixel-perfect Windows 11 transformation suite for KDE Plasma 6. Built for performance, aesthetics, and ease of installation with automatic configuration backups. ![Windows 11 Dark Bloom Preview](assets/win11bloomdark.jpg)

### Key Architectural Capabilities
- **Centered Taskbar Layout**: Centered launcher and pinned task icons with glowing active pill indicators.
- **Windows 11 Caption Buttons**: Minimize, Maximize, and Close titlebar decorations matching Windows 11 styling.
- **Segoe UI Variable Typography**: Full suite of Segoe UI fonts mapped across system UI, menus, and window titles.
- **Dark Bloom 4K Wallpaper**: Windows 11 flagship dark bloom wallpaper pre-configured.
- **Corner "Show Desktop" Button**: Recreates the bottom-left/bottom-right Windows peek and reveal button.
- **Natural Language Clock**: Beautiful desktop text clock widget.

---

## 🏗️ 2. Repository Structure & Directory Map

| Path | Role & Architectural Responsibility |
| :--- | :--- |
| `.github/` | Subsystem directory (.github) |
| `assets/` | Static media assets, fonts, icons, soundscapes |
| `config/` | Default system and application configurations |
| `fonts/` | Subsystem directory (fonts) |
| `install.sh` | System installation and setup automation script |
| `themes/` | Theme color schemes, styling templates, and wallpapers |
| `uninstall.sh` | Shell automation script |

---

## ⚙️ 3. Executable Verification Pipeline

Before marking any task complete, an AI agent **must** run the following verification steps sequentially:

### Tier 1: POSIX Shell Syntax Validation
```bash
bash -n $(find . -maxdepth 3 -name '*.sh' -not -path '*/.*')
```

### Tier 2: ShellCheck Linting
```bash
shellcheck $(find . -maxdepth 3 -name '*.sh' -not -path '*/.*')
```

### Tier 3: Non-Destructive Simulation / Dry-Run
```bash
./install.sh --dry-run || ./install.sh --help
```

---

## 🛡️ 4. Architectural Invariants & Non-Negotiable Rules

### Strict Invariants ("Never Do" List):
1. **Strict Shell Safety:** Every shell script must declare `set -euo pipefail`. Never use `|| true` on critical installation or backup steps.
2. **Preserve Subshell Exit Codes:** Separate `local` variable declarations from command substitutions (ShellCheck SC2155).
3. **Safe Path Expansion:** Always quote variable expansions (e.g. `"$TARGET_DIR"`) to guard against whitespace and path traversal.

### Security & Environment Variables:
- All API keys and secrets must be loaded strictly from environment variables.
- Never commit `.env`, `.pem`, token files, or private credentials.

---

## 🤖 5. Autonomous Agent Operational Protocol

When dispatched to resolve an issue, implement a feature, or refactor code in this repo:

1. **Phase 1 — Explore & Plan:**
   - Read this `AGENTS.md` and relevant source files.
   - Check existing tests to establish the baseline.
2. **Phase 2 — Act (Surgical Implementation):**
   - Implement changes with minimal blast radius.
   - Adhere to the established code style and existing conventions.
3. **Phase 3 — Verify:**
   - Run the Tier 1, 2, and 3 verification commands listed above.
   - Ensure all existing and new tests pass cleanly.
4. **Phase 4 — Reflect:**
   - Review `git diff` to confirm zero unintended whitespace or collateral changes.
   - Confirm no untracked scratch files remain.

---
*Maintained by Ayyappa Pravin • Engineered for Antigravity, Claude, Cursor & Modern Autonomous AI Agents.*
