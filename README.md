# Gemini SEO

Comprehensive SEO analysis skill for Google Gemini / Antigravity. 25 sub-skills
(21 core + 1 orchestrator + 1 framework integration + 2 extension mirrors) and
18 specialist rules cover technical SEO, content quality, schema markup,
sitemaps, Core Web Vitals, AI search optimization (GEO), local SEO, maps
intelligence, semantic clustering, SXO, drift monitoring, e-commerce SEO,
backlinks, and international SEO.

Ported from [claude-seo](https://github.com/AgriciDaniel/claude-seo). The
Python execution engine (55 scripts) is platform-agnostic Python 3.10+.

## Quick Start

```bash
# Point the Antigravity workspace at this repo root, then:
./setup.sh                 # create isolated Python runtime + Chromium
./scripts/gemini-seo doctor --json   # verify readiness
```

## Commands

| Command | What it does |
|---------|-------------|
| `/seo audit <url>` | Full website audit (sequential specialist analyses) |
| `/seo page <url>` | Deep single-page analysis |
| `/seo technical <url>` | Technical SEO audit (9 categories) |
| `/seo content <url>` | E-E-A-T and content quality analysis |
| `/seo content-brief <topic>` | Generate a content brief |
| `/seo schema <url>` | Schema.org detection, validation, generation |
| `/seo sitemap <url>` | XML sitemap analysis or generation |
| `/seo images <url>` | Image SEO: on-page audit, SERP analysis |
| `/seo geo <url>` | AI Overviews / Generative Engine Optimization |
| `/seo plan <type>` | Strategic SEO planning |
| `/seo cluster <keyword>` | SERP-based semantic clustering |
| `/seo sxo <url>` | Search Experience Optimization |
| `/seo drift baseline\|compare\|history <url>` | SEO drift monitoring |
| `/seo ecommerce <url>` | E-commerce SEO |
| `/seo hreflang <url>` | Hreflang/i18n SEO audit |
| `/seo google [cmd] <url>` | Google SEO APIs (GSC, PageSpeed, CrUX, Indexing, GA4) |
| `/seo backlinks <url>` | Backlink profile analysis |
| `/seo local <url>` | Local SEO analysis |
| `/seo maps [cmd]` | Maps intelligence |
| `/seo flow [stage]` | FLOW framework prompts |
| `/seo programmatic [url]` | Programmatic SEO |
| `/seo competitor-pages [url]` | Competitor comparison pages |
| `/seo dataforseo [cmd]` | Live SEO data via DataForSEO (extension) |
| `/seo image-gen [use-case]` | AI image generation for SEO assets (extension) |
| `/seo setup` | Create/refresh the isolated Python runtime and Chromium |
| `/seo doctor` | Check runtime readiness |

## Architecture

```
gemini-seo/
  GEMINI.md                          # Project rules (this repo)
  .claude-plugin/plugin.json         # Antigravity discovery manifest
  skills/                            # 25 sub-skills (auto-discovered)
    seo/                             # Main orchestrator
      SKILL.md
      references/                    # On-demand knowledge files (13 files)
    seo-technical/SKILL.md          # Technical SEO
    ...                              # (24 more sub-skills)
  rules/                             # 18 specialist analyses (was agents/)
    seo-technical.md                # Specialist focus + output format
    ...
  scripts/                           # 55 Python scripts + runtime
    gemini-seo                       # Bash launcher (Python 3.10+ auto-detect)
    runtime.py                       # Managed venv + dependency runtime
    fetch_page.py, parse_html.py, ... # Execution engine
  schema/templates.json              # JSON-LD schema templates
  data/google-updates.json           # Algorithm update history
  hooks/                             # Optional schema-validation hook
```

## Runtime

All bundled Python tools run through the launcher — never a bare interpreter:

```bash
./scripts/gemini-seo run <script.py> [args]
```

The launcher resolves a Python 3.10+ interpreter (override with
`GEMINI_SEO_PYTHON`), then `runtime.py` manages an isolated venv, pins
dependencies (`requirements.txt`), and installs Playwright Chromium into a
dedicated data directory. Set `GEMINI_SEO_ROOT` to this repo's root when
referencing scripts from skill files.

Config (API keys): `~/.config/gemini-seo/google-api.json`,
`~/.config/gemini-seo/backlinks-api.json`.

## Security

- All scripts that fetch user-supplied URLs route through `scripts/url_safety.py`
  (SSRF / DNS-rebinding protection)
- Credentials never ship in the repo (see `.gitignore`)
- OAuth tokens are never stored in client secrets files

## License

MIT. The FLOW framework prompts ship under CC BY 4.0 (see
`skills/seo-flow/SKILL.md`).

## Credits

This project is a conversion of
[**claude-seo**](https://github.com/AgriciDaniel/claude-seo) (created and
maintained by [@AgriciDaniel](https://github.com/AgriciDaniel), MIT License,
Copyright (c) 2026 agricidaniel) into a Google Gemini / Antigravity-native
skill. All SEO logic, sub-skill content, rules, and the Python execution
engine (55 scripts) are inherited from the upstream project.

v1.9.0 community contributions incorporated upstream: Lutfiya Miller
(`seo-cluster`), Chris Muller (`seo-hreflang`), Florian Schmitz (`seo-sxo`),
Dan Colta (`seo-drift`), and Matej Marjanovic (`seo-ecommerce`). See
[CONTRIBUTORS.md](https://github.com/AgriciDaniel/claude-seo/blob/main/CONTRIBUTORS.md)
upstream for details.

Keep this attribution if you redistribute this fork.