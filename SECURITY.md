# Security Policy

## Supported Versions

| Version | Supported |
| ------- | --------- |
| v3.x    | Yes       |
| < v3    | No        |

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Please report security issues by emailing the maintainer directly. Include:

- A description of the vulnerability
- Steps to reproduce
- Potential impact
- Any suggested fix (optional)

You will receive a response within 72 hours. If the issue is confirmed, a patch will be released as quickly as possible and you will be credited (unless you prefer otherwise).

## Security Measures

- All install scripts are served over HTTPS from `raw.githubusercontent.com`
- The landing page enforces a strict Content Security Policy (CSP)
- Branch protection is enabled on `master` — no force pushes or direct commits
- Secret scanning and push protection are enabled on this repository
- Signed commits are required for all releases

## Verifying Install Script Integrity

Before running the install script, you can verify its SHA-256 hash:

```powershell
# Download and check hash before executing
$file = (New-TemporaryFile).FullName + ".ps1"
Invoke-WebRequest https://raw.githubusercontent.com/eugineous/figure-it-out/master/install.ps1 -OutFile $file
Get-FileHash $file -Algorithm SHA256
# Compare output hash against the published hash in the latest release notes
```

```bash
# Mac/Linux
curl -fsSL https://raw.githubusercontent.com/eugineous/figure-it-out/master/install.sh -o /tmp/install.sh
sha256sum /tmp/install.sh
# Compare against the hash in the latest release notes
```
