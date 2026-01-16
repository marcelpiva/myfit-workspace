# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial project setup

## [0.1.0] - 2026-01-16

### Added
- **Workspace**: Initial monorepo structure with my-fit-app, my-fit-web, and my-fit-api
- **my-fit-app** (v1.0.0):
  - Flutter mobile application base structure
  - Authentication with biometrics support
  - Riverpod state management
  - go_router navigation
  - Core UI components and theme
  - Localization setup (pt-BR, en)
- **my-fit-web** (v0.1.0):
  - Next.js 16 landing page
  - Tailwind CSS 4 styling
  - Framer Motion animations
  - Responsive design
- **my-fit-api**:
  - FastAPI backend structure
  - Domain-driven design architecture
  - Authentication module (JWT)
  - User, workout, nutrition, progress domains
  - Check-in and gamification systems
  - Marketplace module

### Technical
- Configured GitHub repository
- Added project documentation
- Set up development environment

[Unreleased]: https://github.com/marcelpiva/my-fit-workspace/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/marcelpiva/my-fit-workspace/releases/tag/v0.1.0
