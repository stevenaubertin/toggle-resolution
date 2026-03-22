# PowerShell & Shell Conventions

## PowerShell — Naming
- Functions: `Verb-Noun` with an approved verb (Get, Set, New, Remove, Invoke, etc.)
- Variables: `$PascalCase` for parameters, `$camelCase` for locals
- Modules: `ModuleName.psm1` in PascalCase
- Tests: `ScriptName.Tests.ps1`

## PowerShell — Function structure
- `[CmdletBinding()]` first
- `param()` block with types and validation
- `begin`, `process`, `end` for pipeline functions
- Return objects, not formatted text
- `Write-Verbose` for debug, not `Write-Host`

## PowerShell — Error handling
- `$ErrorActionPreference = 'Stop'` at the top of the script
- `try/catch/finally` for critical operations
- `-ErrorAction Stop` on individual cmdlets when needed
- Log errors with enough context to debug
- `throw` for fatal errors, `Write-Warning` for non-fatal ones

## PowerShell — Pipeline
- Support the pipeline when it makes sense (`ValueFromPipeline`)
- Process items in the `process` block, not `begin`
- Write functions that do one thing and do it well

## Bash — Conventions
- `set -euo pipefail` required
- Variables in `UPPER_CASE` for constants, `lower_case` for locals
- Functions in `snake_case`
- Always quote variables except in `[[ ]]` with patterns
- `readonly` for constants
- `local` for function variables
- Redirect stderr to a log: `2>>"$LOG_FILE"`

## Bash — Best practices
- Check dependencies at the start of the script (`command -v`)
- Use `trap` for cleanup
- Handle signals (SIGTERM, SIGINT)
- `mktemp` for temporary files
- No `eval` with user content
