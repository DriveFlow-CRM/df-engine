#!/bin/bash
set -e

echo "🚀 Starting DriveFlow local environment..."
docker-compose down -v
docker-compose build
docker-compose up -d

echo "✅ Running containers:"
docker ps
