# Instructions — PowerShell/Shell Project

## Context
Automation scripts in PowerShell or Bash.

## Stack
- PowerShell: PowerShell 7+ (cross-platform)
- Tests: Pester 5+
- Linting: PSScriptAnalyzer
- Bash: ShellCheck for linting

## Commands
- `Invoke-Pester` — Run Pester tests
- `Invoke-ScriptAnalyzer -Path . -Recurse` — Analyze PowerShell code
- `shellcheck script.sh` — Check a Bash script

## Architecture
- One script = one responsibility
- Reusable functions in modules (.psm1)
- Entry scripts in the root folder or `scripts/`
- Config separated from code (.json files, .env, parameters)

## Conventions

### PowerShell
- `Verb-Noun` naming for cmdlets (e.g., `Get-UserReport`, `Set-Configuration`)
- Only use approved verbs (`Get-Verb` for the list)
- Comment-based help on all public functions (`.SYNOPSIS`, `.DESCRIPTION`, `.PARAMETER`, `.EXAMPLE`)
- `[CmdletBinding()]` on advanced functions
- Error handling with `try/catch` and `$ErrorActionPreference = 'Stop'`
- Type your parameters (`[string]`, `[int]`, `[switch]`, etc.)
- No aliases in scripts (e.g., `Where-Object` instead of `?`)

### Bash
- Always start with `set -euo pipefail`
- Shebang: `#!/usr/bin/env bash`
- Quote variables: `"$variable"` not `$variable`
- Use `[[ ]]` instead of `[ ]` for tests
- Functions in snake_case

## Security
- Never hardcode secrets in scripts
- Use `SecureString` or vaults for PowerShell credentials
- Validate parameter inputs with `[ValidateSet()]`, `[ValidateRange()]`, etc.
- No `Invoke-Expression` with user content

## Structure
```
scripts/
├── public/            # Main entry scripts
├── private/           # Internal functions
├── modules/           # .psm1 modules
└── config/            # Configuration files
tests/
├── Unit/
└── Integration/
```
