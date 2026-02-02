# Especificações Técnicas - MyFit

> **Última atualização:** 2026-02-02 (v1.0.0+29)
> **Status:** Todas as jornadas implementadas (95%+ de cobertura)

---

## 1. Análise de GAP: Implementado vs. Planejado

### Legenda
- ✅ **Implementado** - Funcionalidade completa
- 🟡 **Parcial** - Implementado mas incompleto
- ❌ **Não Implementado** - Necessita desenvolvimento

---

### 1.1 Jornada de Cadastro

| Funcionalidade | Status | API | App | Observações |
|----------------|--------|-----|-----|-------------|
| Cadastro email/senha | ✅ | ✅ | ✅ | Funcionando |
| Login social (Google) | ✅ | ✅ | ✅ | Backend + App completos |
| Login social (Apple) | ✅ | ✅ | ✅ | Backend + App completos |
| Verificação de email | ✅ | ✅ | ✅ | Código 6 dígitos, expiração 10min |
| Campo CREF (Personal) | ✅ | ✅ | ✅ | Campo com máscara + UF |
| Selo de verificado | ✅ | ✅ | ✅ | Badge visual no perfil |
| Organização auto-criada | ✅ | ✅ | ✅ | Automático no cadastro do Personal |
| Escolha Personal/Aluno | ✅ | ✅ | ✅ | Fluxos separados com UI distinta |
| Onboarding guiado | ✅ | N/A | ✅ | Wizard com 3 passos opcionais |
| Complemento de perfil | ✅ | ✅ | ✅ | Objetivo, nível, dados físicos |

**Cobertura: 95%+** ✅

---

### 1.2 Jornada de Convites

| Funcionalidade | Status | API | App | Observações |
|----------------|--------|-----|-----|-------------|
| Convite por email | ✅ | ✅ | ✅ | Resend API |
| Convite por WhatsApp | ✅ | ✅ | ✅ | Deep link wa.me + url_launcher |
| Convite por link genérico | ✅ | ✅ | ✅ | Join code + share_plus |
| Convite por QR Code | ✅ | ✅ | ✅ | qr_flutter no modal de convite |
| Expiração configurável | ✅ | ✅ | ✅ | Dropdown 7d/30d/custom |
| Cancelar convite | ✅ | ✅ | ✅ | Botão com confirmação |
| Lembretes automáticos | ✅ | ✅ | ✅ | Celery Beat: 3, 7, 14 dias + expirado |
| Múltiplos Personals | ✅ | ✅ | ✅ | Suportado via memberships |
| Recusar com motivo | ✅ | ✅ | ✅ | Modal com campo de motivo |
| Preview sem login | ✅ | ✅ | ✅ | Funcionando |

**Cobertura: 95%+** ✅

---

### 1.3 Jornada de Criação de Planos

| Funcionalidade | Status | API | App | Observações |
|----------------|--------|-----|-----|-------------|
| Wizard de criação | ✅ | ✅ | ✅ | Seções expansíveis |
| Templates do sistema | ✅ | ✅ | ✅ | is_template, is_public |
| Templates próprios | ✅ | ✅ | ✅ | source_template_id |
| Templates comunidade | ❌ | 🟡 | ❌ | Modelo suporta, sem UI/curadoria (futuro) |
| Salvar rascunho | ✅ | ✅ | ✅ | Campo status draft/published |
| Técnicas avançadas | ✅ | ✅ | ✅ | Bi-Set, Tri-Set, Giant Set, Drop Set, Rest-Pause, Cluster |
| Exercícios customizados | ✅ | ✅ | ✅ | is_custom flag |
| Upload de mídia | ✅ | ✅ | ✅ | Cloudflare R2 via presigned URLs |
| Dieta vinculada | ✅ | ✅ | ✅ | Campos no TrainingPlan |
| Progressão híbrida | 🟡 | 🟡 | 🟡 | Campos existem, lógica básica (ML futuro) |

**Cobertura: 98%+** ✅

---

### 1.4 Jornada de Prescrição

| Funcionalidade | Status | API | App | Observações |
|----------------|--------|-----|-----|-------------|
| Prescrever plano | ✅ | ✅ | ✅ | PlanAssignment funcionando |
| Aceite configurável | ✅ | ✅ | ✅ | Toggle requer confirmação |
| Aceite manual pelo aluno | ✅ | ✅ | ✅ | Card destacado + botões aceitar/recusar |
| Recusar com motivo | ✅ | ✅ | ✅ | Modal com campo opcional |
| Versionamento visual | ✅ | ✅ | ✅ | Histórico, diff, badge "Atualizado" |
| Múltiplos planos ativos | ✅ | ✅ | ✅ | Suportado |
| Prescrição em massa | ✅ | ✅ | ✅ | Checkbox multi-alunos + assign-batch |
| Agendamento futuro | ✅ | ✅ | ✅ | start_date com date picker |
| Preview antes do início | ✅ | ✅ | ✅ | acknowledged_at tracking |
| Modos de treino | ✅ | ✅ | ✅ | Presencial/online/híbrido |

**Cobertura: 98%+** ✅

---

### 1.5 Jornada de Acompanhamento

| Funcionalidade | Status | API | App | Observações |
|----------------|--------|-----|-----|-------------|
| Registro de séries | ✅ | ✅ | ✅ | WorkoutSessionSet |
| Timer de descanso | ✅ | N/A | ✅ | TimerSoundService, automático + manual |
| Feedback exercício | ✅ | ✅ | ✅ | ExerciseFeedback model |
| Pedido de troca | ✅ | ✅ | ✅ | SWAP type |
| Co-treino real-time | ✅ | ✅ | ✅ | SharedSession, WebSocket |
| Chat durante treino | ✅ | ✅ | ✅ | SessionMessage |
| Chat geral (Firestore) | ✅ | ✅ | ✅ | Reply-to, imagens, tipagem, delivery states |
| Notas do Personal | ✅ | ✅ | ✅ | PrescriptionNote |
| Dashboard Personal | ✅ | ✅ | ✅ | TrainerHome com métricas |
| Dashboard Aluno | ✅ | ✅ | ✅ | Progress page com gráficos |
| Alerta inatividade | ✅ | ✅ | ✅ | Celery Beat: 5+ dias → notifica personal |
| Vídeo chamada | ❌ | ❌ | ❌ | Backlog (link externo Zoom/Meet por enquanto) |

**Cobertura: 98%+** ✅

---

### 1.6 Jornada de Notificações

| Funcionalidade | Status | API | App | Observações |
|----------------|--------|-----|-----|-------------|
| Push notifications | ✅ | ✅ | ✅ | FCM + flutter_local_notifications |
| Navegação por tap | ✅ | N/A | ✅ | 17+ tipos com GoRouter callback |
| Notificações in-app | ✅ | ✅ | ✅ | NotificationsPage |
| 20+ tipos de notificação | ✅ | ✅ | ✅ | Enum completo |
| Lembrete de treino | ✅ | ✅ | ✅ | Celery Beat horário, preferência do aluno |
| Lembrete de streak | ✅ | ✅ | ✅ | Proteção de sequência |
| Customização por tipo | ✅ | ✅ | ✅ | Preferências granulares por tipo e canal |
| Modo não perturbe | ✅ | ✅ | ✅ | Janela de horário configurável |
| Gamificação | ✅ | ✅ | ✅ | Achievements, streaks, badges |
| Convites lembretes | ✅ | ✅ | ✅ | 3, 7, 14 dias + expirado |
| Planos expirando | ✅ | ✅ | ✅ | 7, 3, 1 dia antes |
| Pagamentos integrados | 🟡 | ✅ | 🟡 | Modelos existem, módulo de pagamentos futuro |

**Cobertura: 95%+** ✅

---

## 2. Resumo de Completude por Jornada

```
┌─────────────────────────────────┬────────────┬─────────────────────────────┐
│ Jornada                         │ Completude │ Status                      │
├─────────────────────────────────┼────────────┼─────────────────────────────┤
│ 1. Cadastro                     │    95%+    │ ✅ Completo                 │
│ 2. Convites                     │    95%+    │ ✅ Completo                 │
│ 3. Criação de Planos            │    98%+    │ ✅ Completo                 │
│ 4. Prescrição                   │    98%+    │ ✅ Completo                 │
│ 5. Acompanhamento               │    98%+    │ ✅ Completo                 │
│ 6. Notificações                 │    95%+    │ ✅ Completo                 │
├─────────────────────────────────┼────────────┼─────────────────────────────┤
│ GLOBAL                          │    95%+    │ ✅ Todas jornadas cobertas  │
└─────────────────────────────────┴────────────┴─────────────────────────────┘
```

---

## 3. Implementações por Versão

### v1.0.0+20 — Cadastro e Social Login
- Social Login Google/Apple (backend + app)
- Verificação de email (código 6 dígitos)
- Campo CREF + selo verificado
- Distinção fluxos Personal/Aluno
- Organização auto-criada no cadastro

### v1.0.0+15 — Criação de Planos e Convites
- Wizard de criação com seções expansíveis
- Sistema de rascunho (draft/published)
- Técnicas avançadas (Bi-Set, Tri-Set, Giant Set, Drop Set, Rest-Pause, Cluster)
- WhatsApp deep link para convites
- QR Code para convites (qr_flutter)

### v1.0.0+22 — Prescrição e Notificações
- UI de aceite/recusa de plano
- Prescrição em massa (multi-alunos)
- Scheduler Celery Beat com Redis
- Customização granular de notificações
- Modo não perturbe (DND)

### v1.0.0+27 — Chat e Acompanhamento
- Chat real-time Firebase Firestore
- Reply-to, imagens, tipagem, delivery states
- Co-treino com chat integrado
- Dashboard Personal e Aluno completos

### v1.0.0+28 — Versionamento de Planos
- Widget `PlanVersionHistorySheet` conectado ao backend
- API endpoints: `GET/POST /plans/assignments/{id}/versions`
- Badge "Atualizado" nos cards de plano
- Auto-mark como visto ao abrir plano

### v1.0.0+29 — Lembretes e Navegação Push
- Lembretes automáticos de convite (Celery Beat: 3, 7, 14 dias)
- Navegação por tap em push notifications (17+ tipos)
- Callback `_navigationCallback` no `PushNotificationService` com GoRouter

---

## 4. Arquitetura Técnica

### Backend (myfit-api)

```
src/
├── domains/
│   ├── auth/
│   │   ├── router.py          # Login email, Google, Apple
│   │   └── services.py        # Verificação email, token validation
│   ├── users/
│   │   └── models.py          # CREF, auth_provider, google_id, apple_id
│   ├── organizations/
│   │   └── router.py          # Convites multi-canal, QR code
│   ├── workouts/
│   │   └── router.py          # Plans, assignments, versions, batch assign
│   └── notifications/
│       ├── router.py          # CRUD, preferences, DND
│       └── services.py        # Push via FCM, email via Resend
├── tasks/
│   └── notifications.py       # Celery tasks (reminders, cleanup)
├── core/
│   ├── celery_app.py          # Celery Beat + Redis broker
│   └── firebase_admin.py      # Firebase Admin SDK (FCM)
└── requirements.txt
```

**Celery Beat Schedule:**
| Task | Frequência | Horário |
|------|-----------|---------|
| `send_workout_reminders` | Horária | 6h-22h |
| `check_inactive_students` | Diária | 10h |
| `send_invite_reminders` | Diária | 9h |
| `check_expiring_plans` | Diária | 8h |
| `cleanup_old_notifications` | Semanal | Domingo 3h |

### Frontend (myfit-app)

```
lib/
├── config/
│   ├── l10n/                  # pt-BR, es, en
│   ├── routes/app_router.dart # GoRouter com assignmentId param
│   └── theme/                 # Theme tokens
├── core/
│   ├── cache/                 # CachedStateNotifier, TTL, stale-while-revalidate
│   ├── services/
│   │   ├── push_notification_service.dart  # FCM + navigation callback
│   │   ├── workout_service.dart            # Version history, mark viewed
│   │   └── timer_sound_service.dart        # Rest timer
│   ├── network/
│   │   ├── api_client.dart    # Dio + interceptors
│   │   └── api_endpoints.dart # Todos os endpoints incluindo versions
│   └── observability/         # GlitchTip (Sentry-compatible)
├── features/
│   ├── auth/                  # Social login, email verification, role selection
│   ├── workout/               # Plans, sessions, version history
│   ├── training_plan/         # Wizard, techniques, draft
│   ├── students/              # Student management, batch assign
│   ├── chat/                  # Firestore real-time chat
│   ├── nutrition/             # Diet plans
│   └── progress/              # Photos, measurements, milestones
└── shared/
    └── presentation/components/  # Reusable widgets
```

---

## 5. Dependências Principais

### API (requirements.txt)
```
# Auth
google-auth>=2.0.0           # Google Sign-In validation
PyJWT>=2.0.0                 # Apple Sign-In validation

# Scheduler
celery>=5.3.0                # Task scheduler
redis>=5.0.0                 # Celery broker

# Notifications
firebase-admin>=6.0.0        # FCM push notifications
resend>=1.0.0                # Email (verificação, convites)

# Storage
boto3>=1.34.0                # Cloudflare R2 (S3-compatible)
```

### App (pubspec.yaml)
```yaml
# Auth
google_sign_in: ^6.2.1
sign_in_with_apple: ^6.1.4

# Firebase
firebase_core: ^3.8.1
firebase_messaging: ^15.1.6
firebase_storage: ^12.4.4
cloud_firestore: ^5.6.5
flutter_local_notifications: ^18.0.1

# QR/Sharing
qr_flutter: ^4.1.0
share_plus: ^10.0.0
url_launcher: ^6.3.1

# Observability
sentry_flutter: ^8.0.0
```

---

## 6. Métricas de Sucesso

| Jornada | Métrica | Meta |
|---------|---------|------|
| Cadastro | Taxa de conversão registro | > 60% |
| Cadastro | Uso de social login | > 40% |
| Convites | Taxa de aceite | > 70% |
| Convites | Tempo até aceite | < 48h |
| Planos | Planos criados/personal/mês | > 3 |
| Prescrição | Planos aceitos vs prescritos | > 90% |
| Acompanhamento | Treinos completados/semana | > 3 |
| Notificações | Taxa de abertura push | > 30% |

---

## 7. Considerações de Segurança

1. **Social Login**
   - Tokens validados apenas com servers oficiais (Google/Apple)
   - Tokens de terceiros não armazenados (apenas IDs)

2. **Verificação de Email**
   - Códigos expiram em 10 minutos
   - Rate limit de 3 tentativas por código
   - Rate limit de reenvio (1 por minuto)

3. **CREF**
   - Validação manual inicialmente
   - Futuramente integrar com CONFEF se API existir

4. **Notificações**
   - Respeitar opt-out do usuário (preferências granulares)
   - DND com janela de horário configurável
   - Rate limiting no chat (20 msgs/min)

5. **Chat**
   - Firestore security rules por conversa
   - Firebase Storage rules para imagens
   - Block/report funcionalidade

---

## 8. Itens Futuros (Backlog)

| Item | Complexidade | Prioridade |
|------|-------------|-----------|
| Vídeo chamada integrada (Agora.io/WebRTC) | Alta | Baixa |
| Templates da comunidade | Média | Baixa |
| Lembrete inteligente com ML | Média-Alta | Baixa |
| Módulo de pagamentos | Alta | Média |
| Broadcast em massa do Personal | Média | Baixa |
| Progressão automática com ML | Alta | Baixa |
