# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0+23] - 2026-02-05

### Added
- **Training Session Lifecycle** - Complete trainer ↔ student session flow
  - Trainer initiates → student accepts/rejects → synchronized timers → checkout
  - Trainer banner on all tabs (except checkin) with session status and timer
  - Per-student checkout via `POST /checkins/{id}/checkout`
  - Auto-activate/deactivate trainer session on accept/last-checkout
- **Version Display on Welcome Screen** - Build reference on welcome page
- **Self-Account Filter** - Trainer excluded from own student list

### Fixed
- Negative timer (UTC timezone), accept/reject 500 errors, QR persistence, session sync
- Banner button loading states, friendly error messages

---

## [1.0.0+22] - 2026-02-04

### Added
- **Check-in System Overhaul** - Complete redesign of check-in flow across app and API
  - Training sessions with 1-tap check-in, GPS proximity, and trainer-only initiation
  - Check-in acceptance flow with `pending_acceptance` status
  - Push notifications for checkout and session events
  - Re-enabled code-based check-in for QR/manual entry
- **App Version Display** - Subtle version indicator on all home screens for testing identification
- **Responsive Scaling (App)** - `flutter_screenutil` for consistent UI across devices

### Fixed
- Back button restoration, QR code UTC timezone, session refresh, check-in permissions
- Trainer role validation, proximity radius (200m → 500m), multi-membership check-in

---

## [1.0.0+21] - 2026-02-02

### Added
- **Chat UI/UX Overhaul (App)** - Complete redesign of chat for Personal vs Student interaction
  - Refactored monolithic chat into 10 specialized files
  - Role badges, date separators, quick reply chips, expandable input
  - Image/system message rendering, last seen status, swipe-to-action
  - Functional archive, mute, block with Firestore persistence
  - Fixed: new conversation modal, unread counts, student detail chat navigation

## [1.0.0+20] - 2026-02-02

### Added
- **Real-time Chat with Firebase Firestore (App)** - Replaced REST chat with Firestore real-time streams
  - Instant message delivery, typing indicators, online status, read receipts
  - Message rate limiting (20 msgs/min per user)
  - Lazy conversation creation, offline support, org-isolated conversations
  - Firestore security rules and composite indexes deployed

## [1.0.0+19] - 2026-02-02

### Fixed
- **Plan Organization Scoping (API)** - Plans now correctly scoped to organizations
  - `create_plan` now falls back to X-Organization-ID header (matching `create_workout` behavior)
  - Inline workouts created during plan creation now receive the organization_id
  - `duplicate_plan` now propagates organization_id from the active context
  - `list_plans` and `list_workouts` include backward compatibility for legacy plans with NULL organization_id
  - Fixes visibility for Personal trainer templates and Solo student workouts

## [1.0.0+18] - 2026-02-02

### Added
- **4-Section Student Onboarding (App)** - Restructured onboarding inspired by Trainiac/Wellhub
  - Section 1: Personal Info (gender, birthdate, height, weight)
  - Section 2: Goals & Routine (goal, experience, frequency, preferred duration)
  - Section 3: Preferences (training location, preferred activities)
  - Section 4: Health (impact exercise, injuries)
  - New reusable widgets: SectionIntroCard, OnboardingProgressBar, VisualGridSelector
- **New User Profile Fields (API)** - preferred_duration, training_location, preferred_activities, can_do_impact

### Fixed
- **Workout/Plan Org Isolation (API)** - Templates no longer leak between organizations
  - `list_plans()` was using OR instead of AND for org filtering
  - `list_plans()` endpoint now reads X-Organization-ID header (was only accepting query param)
  - `get_plan()` no longer grants access to any plan with an organization_id
- **Dev API IP** - Updated to 192.168.0.102

## [1.0.0] - 2026-01-28

### Fixed
- Authentication required on context switch - token refresh flow fix
- Login redirect after login
- Org creation 404 error
- Student tab scrollable user type page

## [0.6.8] - 2026-01-27

### Fixed
- Former student reinvite flow
- Error interceptor user_id extraction
- Settings page wrong options after social login
- API error messages not displayed

## [0.6.7] - 2026-01-26

### Fixed
- Onboarding edit mode starting at wrong step
- Trainer onboarding edit mode flow
- Keyboard not dismissing on workout complete screen
- Bottom sheet content cut off
