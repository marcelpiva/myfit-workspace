# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.5.0] - 2026-01-20

### Added
- **myfit-app**: ExecutionMode toggle for exercise configuration
  - Three modes: Repetições (Reps), Isometria (Isometric), Combinado (Combined)
  - Automatic mode detection when editing existing exercises
  - Mode-specific fields and time presets

- **myfit-app**: Exercise group notification when changing workout muscle groups
  - Shows informational alert when exercises don't match selected groups
  - Exercises are kept (not deleted) - informational notice only

- **myfit-app**: Auto-switch to "Personalizado" split type when modifying workouts
  - Triggered only by: adding/removing workouts, changing workout name/label

- **myfit-app**: Lock split type selection when editing existing plans
  - Disabled with info banner, selected option shown first

### Fixed
- **myfit-app**: ABC split default workouts now generate automatically on wizard load

- **myfit-app**: White text/icons on selected chips in light mode
  - SegmentedButton, ChoiceChips, ExecutionMode toggle, ExerciseMode toggle

## [1.4.0] - 2026-01-19

### Added
- **myfit-api**: Added `target_muscles` field to AIGeneratedWorkout schema
  - AI-generated programs now include muscle groups for each workout

- **myfit-app**: Added `TechniqueType.biset` support throughout codebase
  - Bi-Set is now distinct from Super-Set (same area vs opposite groups)
  - Added pink color, link icon, and description for Bi-Set
  - Exercise grouping now correctly identifies Bi-Set vs Super-Set

### Fixed
- **myfit-api**: Fixed AI suggestion 500 error
  - Normalized technique types in AI service (isometric → normal, bi_set → biset)
  - Standardized technique type enum values (biset, triset without underscore)

- **myfit-api**: Exercise groups (Bi-Set, Tri-Set, etc.) now save correctly to database
  - `add_exercise_to_workout()` now accepts technique fields (execution_instructions, isometric_seconds, technique_type, exercise_group_id, exercise_group_order)
  - Updated all router calls to pass technique fields through
  - `duplicate_workout()` now copies technique fields

- **myfit-app**: Fixed biset/superset detection and filtering
  - Auto-detects Bi-Set vs Super-Set based on muscle groups (antagonists = Super-Set)
  - Super-Set option hidden when workout has no antagonist muscle pairs
  - Bi-Set: Peito/Ombros, Costas/Biceps (same area muscles)
  - Super-Set: Peito/Costas, Biceps/Triceps (antagonist muscles)
  - Exercise picker filtered to only show exercises from workout's muscle groups

- **myfit-app**: Improved exercise group display and reorder behavior
  - New `_ExerciseGroupCard` widget displays grouped exercises in a bordered card
  - Group header shows technique type, exercise count, instructions button, and disband button
  - Exercises within groups are now aligned (no indent hierarchy)
  - Reorder now moves entire groups together
  - Compact isometric display (icon + seconds instead of "Hold Xs")
  - Removed redundant technique chips from grouped exercises

- **myfit-app**: Added loading indicator for AI suggestion button

- **myfit-app**: Muscle group validation for exercise techniques
  - Super-Set requires antagonist muscle groups (Peito/Costas, Biceps/Triceps)
  - Bi-Set/Tri-Set/Giant Set block antagonist muscles (only allow same area)
  - Visual indicators for blocked exercises (orange border, ban icon, 50% opacity)
  - Info banners showing required/blocked muscle groups
  - Validation snackbars when tapping blocked exercises
  - Reordered technique menu: Superset → Biset → Triset → Giantset

### Changed
- Reorganized repository structure to use Git submodules
- myfit-app, myfit-api, myfit-web are now separate repositories

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
