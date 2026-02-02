# Documentação MyFit

> **Última atualização:** 2026-02-02 (v1.0.0+29)

## Arquivos Disponíveis

| Arquivo | Descrição |
|---------|-----------|
| [journeys-plan.md](./journeys-plan.md) | Wireframes ASCII das 6 jornadas (design de referência) |
| [jornadas-mermaid.md](./jornadas-mermaid.md) | Diagramas Mermaid das 6 jornadas (fluxos visuais) |
| [especificacoes-tecnicas.md](./especificacoes-tecnicas.md) | Análise de GAP, arquitetura técnica e dependências |
| [tasks-gaps.md](./tasks-gaps.md) | 15 tasks de fechamento de GAPs (todas concluídas) |

---

## Resumo Executivo

### Estado Atual do Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│                    COMPLETUDE POR JORNADA                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Cadastro          ███████████████████░  95%+                   │
│  Convites          ███████████████████░  95%+                   │
│  Criação Planos    ████████████████████  98%+                   │
│  Prescrição        ████████████████████  98%+                   │
│  Acompanhamento    ████████████████████  98%+                   │
│  Notificações      ███████████████████░  95%+                   │
│                                                                  │
│  ═══════════════════════════════════════                        │
│  MÉDIA GERAL       ███████████████████░  95%+  ✅              │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### GAPs Resolvidos (15/15 tasks concluídas)

| # | Task | Versão |
|---|------|--------|
| 1 | Social Login (Google/Apple) Backend | ✅ v1.0.0+20 |
| 2 | Verificação de Email | ✅ v1.0.0+20 |
| 3 | Scheduler (Celery) para Notificações | ✅ v1.0.0+22 |
| 4 | Campo CREF + Selo Verificado | ✅ v1.0.0+20 |
| 5 | WhatsApp para Convites | ✅ v1.0.0+15 |
| 6 | QR Code para Convites | ✅ v1.0.0+15 |
| 7 | Sistema de Rascunho | ✅ v1.0.0+15 |
| 8 | Prescrição em Massa | ✅ v1.0.0+22 |
| 9 | UI Aceite/Recusa de Plano | ✅ v1.0.0+22 |
| 10 | Customização Notificações | ✅ v1.0.0+22 |
| 11 | Modo Não Perturbe | ✅ v1.0.0+22 |
| 12 | Distinção Personal/Aluno Cadastro | ✅ v1.0.0+20 |
| 13 | Histórico Versões Plano | ✅ v1.0.0+28 |
| 14 | Lembretes Convite + Navegação Push | ✅ v1.0.0+29 |
| 15 | Upload Real S3/R2 | ✅ v1.0.0+22 |

### Funcionalidades Implementadas

- ✅ Autenticação email/senha + Social Login (Google/Apple)
- ✅ Verificação de email (código 6 dígitos)
- ✅ CREF com selo de verificado para Personal
- ✅ Convites multi-canal (email, WhatsApp, link, QR Code)
- ✅ Lembretes automáticos de convite (3, 7, 14 dias)
- ✅ Técnicas avançadas de treino (Bi-Set, Tri-Set, Giant Set, Drop Set, Rest-Pause, Cluster)
- ✅ Sistema de rascunho para planos
- ✅ Prescrição em massa (multi-alunos)
- ✅ UI de aceite/recusa de plano
- ✅ Versionamento visual de planos (histórico, diff, badge "Atualizado")
- ✅ Co-treino em tempo real com chat
- ✅ Chat real-time Firebase Firestore (reply-to, imagens, tipagem)
- ✅ Push notifications via FCM com navegação por tap (17+ tipos)
- ✅ Celery Beat scheduler (5 tasks agendadas)
- ✅ Customização granular de notificações + Modo Não Perturbe
- ✅ Gamificação (achievements, streaks, badges)
- ✅ Dashboard Personal e Aluno completos
- ✅ Upload de mídia via Cloudflare R2
- ✅ Observability via GlitchTip (Sentry-compatible)
- ✅ Multi-idioma (pt-BR, es, en)

### Backlog (Itens Futuros)

| Item | Prioridade |
|------|-----------|
| Módulo de pagamentos | Média |
| Vídeo chamada integrada | Baixa |
| Templates da comunidade | Baixa |
| Lembrete inteligente com ML | Baixa |
| Progressão automática com ML | Baixa |

---

## Como Visualizar os Diagramas

### Opção 1: GitHub/GitLab
- Renderiza automaticamente ao visualizar o arquivo .md

### Opção 2: Mermaid Live
1. Acesse [mermaid.live](https://mermaid.live)
2. Cole o código entre ` ```mermaid ` e ` ``` `
3. Exporte como PNG, SVG ou PDF

### Opção 3: VS Code
1. Instale a extensão "Markdown Preview Mermaid Support"
2. Abra o arquivo .md
3. Use Ctrl+Shift+V para preview

---

## Links Úteis

- **Mermaid Live Editor**: https://mermaid.live
- **Mermaid Documentação**: https://mermaid.js.org/
