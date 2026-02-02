# Tasks para Fechamento de GAPs - MyFit

> **Última atualização:** 2026-02-02 (v1.0.0+29)
> **Status:** Todas as jornadas completas (95%+)

---

## Resumo das Tasks

| # | Task | Prioridade | Jornada | Status |
|---|------|------------|---------|--------|
| 1 | Social Login (Google/Apple) Backend | 🔴 ALTA | Cadastro | ✅ Implementado |
| 2 | Verificação de Email | 🔴 ALTA | Cadastro | ✅ Implementado |
| 3 | Scheduler (Celery) para Notificações | 🔴 ALTA | Notificações | ✅ Implementado |
| 4 | Campo CREF + Selo Verificado | 🟡 MÉDIA | Cadastro | ✅ Implementado |
| 5 | WhatsApp para Convites | 🟡 MÉDIA | Convites | ✅ Implementado |
| 6 | QR Code para Convites | 🟡 MÉDIA | Convites | ✅ Implementado |
| 7 | Sistema de Rascunho | 🟡 MÉDIA | Criação Planos | ✅ Implementado |
| 8 | Prescrição em Massa | 🟡 MÉDIA | Prescrição | ✅ Implementado |
| 9 | UI Aceite/Recusa de Plano | 🟡 MÉDIA | Prescrição | ✅ Implementado |
| 10 | Customização Notificações | 🟢 BAIXA | Notificações | ✅ Implementado |
| 11 | Modo Não Perturbe | 🟢 BAIXA | Notificações | ✅ Implementado |
| 12 | Distinção Personal/Aluno Cadastro | 🟡 MÉDIA | Cadastro | ✅ Implementado |
| 13 | Histórico Versões Plano | 🟢 BAIXA | Prescrição | ✅ v1.0.0+28 |
| 14 | Lembretes Convite | 🟡 MÉDIA | Convites | ✅ v1.0.0+29 |
| 15 | Upload Real S3/R2 | 🟢 BAIXA | Infraestrutura | ✅ Implementado |

---

## Detalhes das Implementações Recentes

### #13 — Histórico Versões Plano (v1.0.0+28)
- Widget `PlanVersionHistorySheet` conectado ao backend (já existia orphaned)
- API endpoints: `GET/POST /plans/assignments/{id}/versions`
- Menu "Histórico de Versões" no detalhe do plano
- Badge "Atualizado" nos cards de plano do aluno
- Auto-mark como visto ao abrir plano
- `assignmentId` propagado pela rota para todos os pontos de navegação

### #14 — Lembretes Convite + Navegação Push (v1.0.0+29)
- Backend já implementado: Celery Beat roda `send_invite_reminders()` diariamente às 9h
  - 3 dias: push + email ao convidado
  - 7 dias: notificação in-app + push ao remetente
  - 14 dias: push + email final ao convidado
  - Notificação de convite expirado ao remetente
- Frontend: implementada navegação por tap em push notifications (17+ tipos)
  - Callback `_navigationCallback` no `PushNotificationService` conectado ao `GoRouter`
  - Switch abrangente: convites, planos, treinos, feedback, chat, organização

### #3 — Scheduler Celery (já implementado no backend)
- Celery Beat com Redis broker
- Tasks agendadas:
  - `send-workout-reminders-hourly` — a cada hora 6h-22h
  - `check-inactive-students-daily` — diariamente às 10h
  - `send-invite-reminders-daily` — diariamente às 9h
  - `check-expiring-plans-daily` — diariamente às 8h
  - `cleanup-old-notifications-weekly` — domingo às 3h
- Preferências granulares de notificação por tipo e canal
- DND (Não Perturbe) com janela de horário

---

## Checklist de Fidelidade às Jornadas

### Jornada 1: Cadastro — 95%+
- [x] Fluxos separados Personal/Aluno (#12)
- [x] Social login Google (#1)
- [x] Social login Apple (#1)
- [x] Verificação de email (#2)
- [x] CREF com selo (#4)
- [x] Organização auto-criada
- [x] Onboarding guiado

### Jornada 2: Convites — 95%+
- [x] Email
- [x] WhatsApp (#5)
- [x] Link genérico
- [x] QR Code (#6)
- [x] Expiração configurável
- [x] Cancelar convite
- [x] Lembretes automáticos (#14) — 3, 7, 14 dias
- [x] Múltiplos Personals
- [x] Recusar com motivo

### Jornada 3: Criação de Planos — 98%+
- [x] Wizard passo-a-passo
- [x] Templates sistema
- [x] Templates próprios
- [x] Salvar rascunho (#7)
- [x] Técnicas avançadas (Bi-Set, Tri-Set, Giant Set, Drop Set, Rest-Pause, Cluster)
- [x] Exercícios customizados
- [x] Dieta vinculada

### Jornada 4: Prescrição — 98%+
- [x] Aceite configurável
- [x] UI de aceite/recusa (#9)
- [x] Versionamento visual (#13) — lista, diff, badge "Atualizado"
- [x] Múltiplos planos ativos
- [x] Prescrição em massa (#8)
- [x] Modos de treino

### Jornada 5: Acompanhamento — 98%+
- [x] Registro séries
- [x] Timer descanso
- [x] Feedback exercício
- [x] Co-treino real-time
- [x] Chat durante treino
- [x] Dashboard Personal
- [x] Dashboard Aluno

### Jornada 6: Notificações — 95%+
- [x] Push notifications (FCM)
- [x] Navegação por tap em notificações (17+ tipos)
- [x] Lembrete treino (horário preferido do usuário)
- [x] Lembrete streak (proteção de sequência)
- [x] Alunos inativos (5+ dias → notifica personal)
- [x] Plano expirando (7, 3, 1 dia antes)
- [x] Customização granular (#10)
- [x] Modo não perturbe (#11)
- [x] Gamificação

---

## Métricas Finais

| Jornada | Anterior | Atual |
|---------|----------|-------|
| Cadastro | 65% | 95%+ |
| Convites | 70% | 95%+ |
| Criação Planos | 85% | 98%+ |
| Prescrição | 75% | 98%+ |
| Acompanhamento | 85% | 98%+ |
| Notificações | 60% | 95%+ |

**Status Global: 95%+ de cobertura das jornadas definidas** ✅
