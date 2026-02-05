# MyFit Workspace

[![Version](https://img.shields.io/badge/version-1.0.0+23-blue.svg)](CHANGELOG.md)

Complete fitness platform for personal trainers, coaches, gyms, and fitness professionals.

## Overview

MyFit is a comprehensive fitness platform that allows professionals to:
- Create and manage workout plans
- Build nutrition/diet plans
- Track client progress (photos, measurements, performance)
- Communicate via real-time chat
- Process payments and subscriptions
- Offer their services through a marketplace

Users can have multiple roles (student, trainer, coach, gym owner) and belong to multiple organizations simultaneously.

## Repository Structure

This is a monorepo using Git submodules:

```
myfit-workspace/
├── myfit-app/    # Flutter mobile app (submodule)
├── myfit-api/    # FastAPI backend (submodule)
├── myfit-web/    # Next.js landing page (submodule)
├── docs/         # Documentation
└── assets/       # Shared brand assets
```

### Submodules

| Repository | Description |
|------------|-------------|
| [myfit-app](https://github.com/marcelpiva/myfit-app) | Flutter mobile application |
| [myfit-api](https://github.com/marcelpiva/myfit-api) | FastAPI backend |
| [myfit-web](https://github.com/marcelpiva/myfit-web) | Next.js landing page |

## Technology Stack

| Component | Technology |
|-----------|------------|
| Mobile App | Flutter 3.x, Riverpod, go_router |
| Backend | FastAPI, PostgreSQL, Redis, Celery |
| Landing Page | Next.js 16, Tailwind CSS 4 |
| AI | OpenAI/Claude API |
| Payments | Stripe, PagSeguro, Asaas |

## Getting Started

### Prerequisites

- Flutter SDK 3.x
- Python 3.11+
- Node.js 20+
- PostgreSQL 16
- Redis 7
- Docker (optional)

### Clone with Submodules

```bash
# Clone with all submodules
git clone --recurse-submodules https://github.com/marcelpiva/my-fit-workspace.git
cd my-fit-workspace

# Or if already cloned, init submodules
git submodule update --init --recursive
```

### Setup

```bash
# Setup Flutter app
cd myfit-app
flutter pub get

# Setup API
cd ../myfit-api
python -m venv .venv
source .venv/bin/activate  # or `.venv\Scripts\activate` on Windows
pip install -e ".[dev]"

# Setup Web
cd ../myfit-web
npm install
```

### Running

```bash
# Run Flutter app
cd myfit-app && flutter run

# Run API (with Docker)
cd myfit-api
docker-compose up -d
uvicorn src.main:app --reload

# Run Web
cd myfit-web && npm run dev
```

### Updating Submodules

```bash
# Update all submodules to latest
git submodule update --remote --merge

# Update specific submodule
git submodule update --remote myfit-app
```

## Design System

### Colors

| Token | Light | Dark |
|-------|-------|------|
| Primary | #f53321 | #ff513c |
| Secondary | #00a0b1 | #00c2d4 |
| Accent | #00a927 | #00d13b |
| Background | #f8fafe | #010207 |

### Typography

- Font: Manrope (Google Fonts)
- Weights: 400, 500, 600, 700

## Domain

- **Production**: https://myfitplatform.com
- **API**: https://api.myfitplatform.com
- **App**: https://app.myfitplatform.com

## Development

### Running API with Docker

```bash
cd myfit-iac/docker
docker compose up -d
```

This starts PostgreSQL, Redis, API, Celery worker and beat.

### Testing on Physical Device (iPhone/Android)

The app uses different API URLs based on environment:

| Environment | API URL |
|-------------|---------|
| Development | `http://192.168.0.102:8000/api/v1` |
| Staging | `https://api.myfitplatform.com/api/v1` |
| Production | `https://api.myfitplatform.com/api/v1` |

#### Building for Local Testing (Device → Docker)

```bash
# Build with development environment (points to local Docker)
flutter build ipa --release --dart-define=ENV=dev

# Or for Android
flutter build apk --release --dart-define=ENV=dev
```

#### Building for Production/TestFlight

```bash
# Using Fastlane (recommended)
cd myfit-app/ios && fastlane beta

# Or manually with production environment
flutter build ipa --release --dart-define=ENV=prod
```

### Troubleshooting

#### "Internal Server Error" on Authentication

**Symptom**: App returns 500 error when trying to login/register, but `/health` works.

**Cause**: A local uvicorn process may be running outside Docker on the same port (8000).

**Solution**:

```bash
# Check what's using port 8000
lsof -i :8000

# If you see a local Python/uvicorn process (not com.docker), kill it
kill <PID>

# Verify Docker is now handling requests
curl http://192.168.0.102:8000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"test"}'
# Should return 401 (invalid credentials), not 500
```

#### Device Can't Connect to Docker API

**Checklist**:

1. Device and Mac must be on the same Wi-Fi network
2. Check Mac's current IP: `ifconfig | grep "inet " | grep -v 127.0.0.1`
3. Update the IP in `myfit-app/lib/core/config/environment.dart` if it changed
4. Ensure Docker containers are running: `docker ps`
5. Test from Mac: `curl http://<YOUR_IP>:8000/health`

#### App Points to Wrong Environment

If the app is pointing to the wrong API:

1. Check how it was built (with or without `--dart-define=ENV=...`)
2. Default is `development` if not specified
3. Rebuild with correct environment flag

## License

Proprietary - All rights reserved.
