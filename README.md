# DF Engine - Orchestrator

## Deployment (VPS)

This repo is designed to deploy with GitHub Actions via SSH into your VPS and
restart containers without removing volumes (MySQL data persists).

### Required GitHub Secrets (all repos)

- `VPS_HOST` (server IP/hostname)
- `VPS_USER` (SSH user)
- `VPS_SSH_KEY` (private key)
- `VPS_PORT` (SSH port, e.g. 22)
- `VPS_APP_PATH` (absolute path to the `df-engine` repo on the VPS)

### Deploy script

The VPS should have this repo cloned. The workflow runs:

- Full stack: `./scripts/deploy.sh`
- API only: `./scripts/deploy.sh df-api`
- Accountant only: `./scripts/deploy.sh df-accountant`

These commands perform a `git pull`, update submodules, rebuild images, and
restart containers without deleting volumes.
