# MyFit Workspace

[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)](CHANGELOG.md)

White-label fitness platform for personal trainers, coaches, gyms, and fitness professionals.

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

## License

Proprietary - All rights reserved.
