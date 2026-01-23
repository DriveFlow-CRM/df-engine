#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [ "$#" -eq 0 ]; then
  echo "Deploying full stack from df-engine..."
  git pull --ff-only origin main
  git submodule update --init --recursive
  docker compose build
  docker compose up -d
  exit 0
fi

echo "Deploying services: $*"

for service in "$@"; do
  case "$service" in
    df-api)
      git -C services/df-api pull --ff-only origin main
      ;;
    df-accountant)
      git -C services/df-accountant pull --ff-only origin main
      ;;
    *)
      echo "Unknown service: $service" >&2
      exit 1
      ;;
  esac
done

docker compose build "$@"
docker compose up -d --no-deps "$@"
