# Especificação de Telas - MyFit

Este documento especifica todas as telas do aplicativo MyFit, organizadas por jornada do usuário.

---

## 1. Autenticação & Cadastro

### 1.1 Splash Screen

**Rota:** `/` (inicial)

**Descrição:** Tela de carregamento inicial com logo animado.

**Componentes:**
- Logo MyFit animado (fade-in + scale)
- Indicador de carregamento sutil
- Gradient de fundo (primary → secondary)

**Estados:**
- Loading: Verifica autenticação
- Authenticated: Redireciona para Home
- Not authenticated: Redireciona para Welcome

**Ações do Usuário:**
- Nenhuma (automático)

**Dados (API):**
- `GET /auth/me` - Verificar token

---

### 1.2 Welcome Screen

**Rota:** `/welcome`

**Descrição:** Tela de boas-vindas para novos usuários escolherem seu tipo.

**Componentes:**
- Logo MyFit
- Título: "Bem-vindo ao MyFit"
- Subtítulo: "Como você quer começar?"
- Card "Sou Personal"
  - Ícone: clipboard-list
  - Descrição: "Gerencie seus alunos e prescreva treinos"
- Card "Sou Aluno"
  - Ícone: dumbbell
  - Descrição: "Receba treinos e acompanhe seu progresso"
- Link: "Já tenho conta? Entrar"

**Estados:**
- Default: Exibe opções

**Ações do Usuário:**
- Tap "Sou Personal" → `/register?type=trainer`
- Tap "Sou Aluno" → `/register?type=student`
- Tap "Entrar" → `/login`

---

### 1.3 Login

**Rota:** `/login`

**Descrição:** Tela de login com email/senha ou social.

**Componentes:**
- Logo MyFit (menor)
- Título: "Entrar"
- Campo Email (TextInput)
- Campo Senha (TextInput, obscured)
- Link: "Esqueci minha senha"
- Botão: "Entrar" (primary, full-width)
- Divider: "ou continue com"
- Botão Google (outlined)
- Botão Apple (outlined, apenas iOS)
- Link: "Não tem conta? Criar conta"

**Estados:**
- Default: Formulário vazio
- Loading: Botão com spinner
- Error: Snackbar com mensagem

**Ações do Usuário:**
- Preencher campos → habilita botão
- Tap "Entrar" → Autentica
- Tap "Google" → OAuth Google
- Tap "Apple" → OAuth Apple
- Tap "Esqueci senha" → `/forgot-password`
- Tap "Criar conta" → `/register`

**Dados (API):**
- `POST /auth/login` - Email/senha
- `POST /auth/social-login` - Google/Apple

---

### 1.4 Registro

**Rota:** `/register`

**Descrição:** Tela de cadastro com dados básicos.

**Componentes:**
- Título: "Criar conta"
- Subtítulo: "Preencha seus dados para começar"
- Campo Nome completo
- Campo Email
- Campo Senha
- Campo Confirmar senha
- Checkbox: "Li e aceito os Termos de Uso"
- Botão: "Criar conta" (primary)
- Divider: "ou cadastre com"
- Botão Google
- Botão Apple
- Link: "Já tem conta? Entrar"

**Estados:**
- Default: Formulário vazio
- Validating: Indicadores de erro nos campos
- Loading: Botão com spinner
- Error: Snackbar com mensagem

**Ações do Usuário:**
- Preencher campos → validação em tempo real
- Tap "Criar conta" → Envia cadastro
- Tap social → OAuth flow

**Dados (API):**
- `POST /auth/register`

---

### 1.5 Verificação de Email

**Rota:** `/verify-email`

**Descrição:** Tela para inserir código de 6 dígitos enviado por email.

**Componentes:**
- Ícone: mail-check (grande)
- Título: "Verifique seu email"
- Subtítulo: "Enviamos um código para [email]"
- 6 campos de dígito (OTP input)
- Timer: "Reenviar em 00:30"
- Link: "Reenviar código" (após timer)
- Link: "Usar outro email"

**Estados:**
- Default: Campos vazios, timer ativo
- Validating: Campos preenchidos, verificando
- Error: Campos com borda vermelha
- Success: Redireciona automaticamente

**Ações do Usuário:**
- Digitar código → auto-submit ao completar
- Tap "Reenviar" → Novo código
- Tap "Outro email" → Volta para registro

**Dados (API):**
- `POST /auth/verify-email`
- `POST /auth/resend-code`

---

### 1.6 Perfil Profissional (Personal)

**Rota:** `/onboarding/professional-profile`

**Descrição:** Complemento de perfil para Personal Trainers.

**Componentes:**
- Progress bar (etapa 1/3)
- Título: "Perfil Profissional"
- Avatar picker (câmera/galeria)
- Campo CREF (opcional)
  - Helper: "Adicione para receber selo verificado"
- Multi-select: Especialidades
  - Musculação
  - Funcional
  - Crossfit
  - Pilates
  - etc.
- Campo: Anos de experiência (slider 1-30)
- Campo: Bio (textarea, max 200 chars)
- Botão: "Continuar" (primary)
- Link: "Pular por agora"

**Estados:**
- Default: Campos opcionais vazios
- Loading: Upload de foto
- Error: Validação

**Ações do Usuário:**
- Tap avatar → Abre picker
- Selecionar especialidades
- Ajustar experiência
- Tap "Continuar" → Próxima etapa
- Tap "Pular" → Próxima etapa (sem preencher)

**Dados (API):**
- `PUT /users/me/profile`
- `POST /uploads/avatar`

---

### 1.7 Complemento de Perfil (Aluno)

**Rota:** `/onboarding/student-profile`

**Descrição:** Coleta de informações do aluno para personalização.

**Componentes:**
- Progress bar (etapa atual)
- **Tela 1 - Objetivo:**
  - Título: "Qual seu principal objetivo?"
  - Cards selecionáveis:
    - Ganhar massa muscular
    - Perder gordura
    - Condicionamento físico
    - Saúde geral
- **Tela 2 - Nível:**
  - Título: "Qual seu nível de experiência?"
  - Radio buttons:
    - Iniciante (< 6 meses)
    - Intermediário (6m - 2 anos)
    - Avançado (> 2 anos)
- **Tela 3 - Dados Físicos:**
  - Campo Peso (kg)
  - Campo Altura (cm)
  - Campo Idade (anos)
- **Tela 4 - Frequência:**
  - Título: "Quantas vezes por semana?"
  - Chips selecionáveis: 2x, 3x, 4x, 5x, 6x
- **Tela 5 - Restrições:**
  - Título: "Alguma restrição?"
  - Checkboxes:
    - Nenhuma
    - Problema na coluna
    - Problema no joelho
    - Outro (campo texto)
- Botão: "Continuar" / "Concluir"
- Link: "Pular" (em cada etapa)

**Estados:**
- Default: Nenhuma seleção
- Selected: Item destacado
- Loading: Salvando

**Ações do Usuário:**
- Selecionar opções
- Navegar entre etapas
- Pular etapas

**Dados (API):**
- `PUT /users/me/profile`

---

### 1.8 Onboarding Guiado (Personal)

**Rota:** `/onboarding/guide`

**Descrição:** Primeiros passos sugeridos para novos Personals.

**Componentes:**
- Título: "Pronto para começar!"
- Subtítulo: "Sugestões para você"
- Card 1: "Convidar primeiro aluno"
  - Ícone: user-plus
  - Botão: "Convidar"
- Card 2: "Criar primeiro plano"
  - Ícone: clipboard-plus
  - Botão: "Criar"
- Card 3: "Explorar templates"
  - Ícone: layout-template
  - Botão: "Ver templates"
- Link: "Pular → Ir para Dashboard"

**Estados:**
- Default: Todos cards visíveis

**Ações do Usuário:**
- Tap card → Ação específica
- Tap "Pular" → Dashboard

---

## 2. Convites

### 2.1 Enviar Convite (Personal)

**Rota:** Bottom sheet em `/students`

**Descrição:** Formulário para convidar novo aluno.

**Componentes:**
- Handle bar
- Título: "Convidar Aluno"
- Campo Email (obrigatório)
- Campo Nome (opcional)
- Campo Telefone (opcional)
- Campo Observações (textarea, opcional)
- Dropdown: Validade do convite
  - 7 dias
  - 30 dias
  - Personalizado
- Seção: "Como enviar?"
  - Botão Email (ícone mail)
  - Botão WhatsApp (ícone message-circle)
  - Botão Link (ícone link)
  - Botão QR Code (ícone qr-code)
- Botão: "Criar Convite" (primary)

**Estados:**
- Default: Formulário vazio
- Valid: Email preenchido
- Loading: Criando convite
- Success: Exibe opções de compartilhamento

**Ações do Usuário:**
- Preencher email
- Selecionar método de envio
- Tap "Criar Convite"

**Dados (API):**
- `POST /organizations/{id}/invite`

---

### 2.2 Compartilhamento de Convite

**Rota:** Bottom sheet (após criar convite)

**Descrição:** Opções de compartilhamento do convite criado.

**Componentes:**
- Título: "Convite criado!"
- Subtítulo: "Compartilhe com seu aluno"
- **Aba Email:**
  - Preview do email
  - Botão: "Enviar Email"
- **Aba WhatsApp:**
  - Preview da mensagem
  - Botão: "Abrir WhatsApp"
- **Aba Link:**
  - Campo com link (readonly)
  - Botão: "Copiar Link"
- **Aba QR Code:**
  - QR Code grande
  - Botão: "Compartilhar QR"
- Botão: "Concluído"

**Estados:**
- Default: Primeira aba selecionada
- Copied: Toast "Link copiado"
- Sent: Toast "Email enviado"

**Ações do Usuário:**
- Alternar abas
- Executar ação de cada aba
- Fechar sheet

**Dados (API):**
- `POST /invites/{id}/send-email`

---

### 2.3 Preview de Convite (Aluno)

**Rota:** `/invite/{token}`

**Descrição:** Visualização do convite antes de aceitar.

**Componentes:**
- Ícone animado (user-check)
- Título: "Você foi convidado!"
- Subtítulo: "[Nome] te convidou para treinar"
- Card de detalhes:
  - Linha: Organização (ícone building)
  - Linha: Função (ícone user)
  - Linha: Email (ícone mail)
- Botão: "Aceitar Convite" (primary)
- Botão: "Recusar" (outlined, destructive)
- Link: "Já tenho conta? Entrar"

**Estados:**
- Loading: Carregando preview
- Error: Convite inválido/expirado
- Default: Exibe detalhes

**Ações do Usuário:**
- Tap "Aceitar" → Cadastro/Login + aceite
- Tap "Recusar" → Formulário de recusa
- Tap "Entrar" → Login com token

**Dados (API):**
- `GET /organizations/invite/preview/{token}`

---

### 2.4 Recusar Convite

**Rota:** Bottom sheet em `/invite/{token}`

**Descrição:** Formulário para recusar convite com motivo.

**Componentes:**
- Ícone: message-square (destructive color)
- Título: "Recusar convite"
- Subtítulo: "Se desejar, informe o motivo:"
- Campo Motivo (textarea, opcional)
- Botão: "Cancelar" (outlined)
- Botão: "Confirmar Recusa" (destructive)

**Estados:**
- Default: Campo vazio
- Loading: Enviando recusa

**Ações do Usuário:**
- Preencher motivo (opcional)
- Confirmar recusa
- Cancelar

**Dados (API):**
- `POST /organizations/accept-invite` (decline=true)

---

### 2.5 Lista de Convites Pendentes (Personal)

**Rota:** `/invites` ou tab em `/students`

**Descrição:** Gerenciamento de convites enviados.

**Componentes:**
- Título: "Convites Pendentes"
- Lista de convites:
  - Avatar placeholder
  - Email/Nome do convidado
  - Data de envio
  - Status (Pendente/Expirado)
  - Ações:
    - Reenviar (ícone refresh)
    - Cancelar (ícone x)
- Empty state: "Nenhum convite pendente"
- FAB: "+ Novo Convite"

**Estados:**
- Loading: Skeleton
- Empty: Ilustração + mensagem
- Default: Lista de convites

**Ações do Usuário:**
- Tap convite → Detalhes
- Tap reenviar → Reenvia
- Tap cancelar → Confirma cancelamento
- Tap FAB → Novo convite

**Dados (API):**
- `GET /organizations/{id}/invites`
- `POST /organizations/{id}/invites/{id}/resend`
- `DELETE /organizations/{id}/invites/{id}`

---

## 3. Criação de Planos

### 3.1 Lista de Planos

**Rota:** `/plans`

**Descrição:** Listagem de planos do Personal.

**Componentes:**
- AppBar com título "Meus Planos"
- Tabs: "Todos" | "Templates" | "Rascunhos"
- Campo de busca
- Lista de cards:
  - Nome do plano
  - Objetivo (chip)
  - Dificuldade (chip)
  - Duração (semanas)
  - Qtd treinos
  - Menu: Editar, Duplicar, Excluir
- Empty state por tab
- FAB: "+ Novo Plano"

**Estados:**
- Loading: Skeleton
- Empty: Ilustração específica
- Default: Lista

**Ações do Usuário:**
- Buscar planos
- Alternar tabs
- Tap card → Detalhes/Editar
- Tap menu → Ações
- Tap FAB → Criar plano

**Dados (API):**
- `GET /plans`
- `DELETE /plans/{id}`

---

### 3.2 Wizard - Etapa 1: Informações Básicas

**Rota:** `/plans/create` (step 1)

**Descrição:** Primeiro passo do wizard de criação.

**Componentes:**
- AppBar: "Novo Plano" + botão fechar
- Stepper horizontal (4 etapas)
- Título: "Informações Básicas"
- Campo Nome do plano
- Dropdown Objetivo:
  - Hipertrofia
  - Emagrecimento
  - Condicionamento
  - Força
  - Reabilitação
- Dropdown Dificuldade:
  - Iniciante
  - Intermediário
  - Avançado
- Campo Duração (semanas)
- Campo Descrição (textarea)
- Botão: "Próximo" (primary)
- Link: "Salvar rascunho"

**Estados:**
- Default: Campos vazios
- Valid: Nome preenchido
- Loading: Salvando

**Ações do Usuário:**
- Preencher campos
- Tap "Próximo" → Etapa 2
- Tap "Salvar rascunho"

---

### 3.3 Wizard - Etapa 2: Estrutura de Split

**Rota:** `/plans/create` (step 2)

**Descrição:** Definição da estrutura de treinos.

**Componentes:**
- Stepper (etapa 2 ativa)
- Título: "Estrutura de Split"
- Radio cards:
  - ABC (3 dias)
  - ABCD (4 dias)
  - Push/Pull/Legs (3-6 dias)
  - Upper/Lower (4 dias)
  - Full Body (2-3 dias)
  - Personalizado
- Se "Personalizado":
  - Campo: Quantidade de treinos
  - Lista de treinos criados
  - Botão: "+ Adicionar Treino"
- Preview da estrutura
- Botões: "Voltar" | "Próximo"

**Estados:**
- Default: Nenhum selecionado
- Selected: Split escolhido
- Custom: Campos adicionais visíveis

**Ações do Usuário:**
- Selecionar split
- Configurar personalizado
- Navegar entre etapas

---

### 3.4 Wizard - Etapa 3: Exercícios

**Rota:** `/plans/create` (step 3)

**Descrição:** Adicionar exercícios a cada treino.

**Componentes:**
- Stepper (etapa 3 ativa)
- Tabs: "Treino A" | "Treino B" | ...
- Lista de exercícios (drag & drop):
  - Número da ordem
  - Nome do exercício
  - Séries x Reps
  - Descanso
  - Ícones: mover, editar, remover
- Botão: "+ Adicionar Exercício"
- Botões: "Voltar" | "Próximo"

**Estados:**
- Empty: Nenhum exercício
- Default: Lista com exercícios
- Dragging: Item sendo arrastado

**Ações do Usuário:**
- Tap "Adicionar" → Sheet de seleção
- Drag exercício → Reordenar
- Tap exercício → Editar configuração
- Tap remover → Confirma remoção

---

### 3.5 Seleção de Exercícios

**Rota:** Bottom sheet

**Descrição:** Buscar e selecionar exercícios do banco.

**Componentes:**
- Handle bar
- Campo de busca
- Filtros (chips):
  - Grupo muscular
  - Equipamento
  - Dificuldade
- Lista de exercícios:
  - Thumbnail do vídeo
  - Nome
  - Tags (grupo, equipamento)
  - Botão: "Selecionar"
- Link: "+ Criar exercício customizado"

**Estados:**
- Default: Exercícios populares
- Searching: Resultados da busca
- Filtered: Resultados filtrados
- Empty: Nenhum resultado

**Ações do Usuário:**
- Buscar por nome
- Aplicar filtros
- Tap exercício → Seleciona
- Tap "Ver vídeo" → Modal com vídeo

**Dados (API):**
- `GET /exercises`

---

### 3.6 Configuração de Exercício

**Rota:** Bottom sheet

**Descrição:** Configurar detalhes do exercício selecionado.

**Componentes:**
- Título: Nome do exercício
- Thumbnail do vídeo
- Modo (radio):
  - Força (séries/reps)
  - Tempo (segundos)
  - HIIT (intervalos)
  - Distância (metros)
- Campos (modo Força):
  - Séries (stepper)
  - Repetições (campo ou range)
  - Descanso (segundos)
  - Carga inicial (kg, opcional)
- Seção "Técnica Avançada" (expansível):
  - Checkbox: Superset com [select]
  - Checkbox: Drop-set
  - Checkbox: Rest-pause
  - Checkbox: Cluster
  - Checkbox: Pirâmide
- Campo: Observações
- Botões: "Cancelar" | "Adicionar"

**Estados:**
- Default: Valores padrão
- Custom: Valores alterados
- Advanced: Técnica selecionada

**Ações do Usuário:**
- Ajustar valores
- Selecionar técnica
- Confirmar ou cancelar

---

### 3.7 Wizard - Etapa 4: Revisão

**Rota:** `/plans/create` (step 4)

**Descrição:** Revisar plano antes de salvar.

**Componentes:**
- Stepper (etapa 4 ativa)
- Título: "Revisão"
- Card resumo:
  - Nome do plano
  - Objetivo
  - Dificuldade
  - Duração
- Accordion por treino:
  - Nome do treino
  - Lista de exercícios resumida
  - Total de séries
- Alerta (se houver problemas)
- Botões:
  - "Voltar"
  - "Salvar como Template"
  - "Salvar Plano" (primary)

**Estados:**
- Default: Revisão completa
- Warning: Problemas detectados
- Loading: Salvando

**Ações do Usuário:**
- Expandir treinos
- Voltar para editar
- Salvar plano

**Dados (API):**
- `POST /plans`

---

## 4. Prescrição

### 4.1 Lista de Alunos

**Rota:** `/students`

**Descrição:** Lista de alunos do Personal com status.

**Componentes:**
- AppBar: "Meus Alunos"
- Filtros (chips): Todos | Ativos | Inativos | Novos
- Campo de busca
- Métricas resumo:
  - Total de alunos
  - Aderência média
- Lista de cards:
  - Avatar + iniciais
  - Nome
  - Status online (dot verde/amarelo)
  - Badge de prescrição:
    - Pendente (amarelo)
    - Aceito (verde)
    - Recusado (vermelho)
    - Ativo (azul)
  - Última atividade
  - Aderência (%)
  - Chevron
- FAB: "+ Adicionar Aluno"

**Estados:**
- Loading: Skeleton
- Empty: Ilustração + CTA
- Default: Lista

**Ações do Usuário:**
- Filtrar por status
- Buscar aluno
- Tap card → Detalhes do aluno
- Tap FAB → Convidar aluno

**Dados (API):**
- `GET /organizations/{id}/members`
- `GET /workouts/plan-assignments`

---

### 4.2 Detalhes do Aluno

**Rota:** `/students/{id}`

**Descrição:** Perfil completo do aluno.

**Componentes:**
- AppBar com menu (3 dots)
- Header:
  - Avatar grande
  - Nome
  - Status (ativo/inativo)
  - Membro desde
- Tabs: "Visão Geral" | "Treinos" | "Progresso"
- **Tab Visão Geral:**
  - Card Plano Atual
  - Card Métricas (aderência, streak)
  - Card Dados Físicos
- **Tab Treinos:**
  - Histórico de sessões
- **Tab Progresso:**
  - Gráficos de evolução
- Botão fixo: "Prescrever Plano"

**Estados:**
- Loading: Skeleton
- Default: Dados carregados

**Ações do Usuário:**
- Navegar entre tabs
- Tap "Prescrever" → Sheet de prescrição
- Menu: Mensagem, Remover aluno

**Dados (API):**
- `GET /students/{id}/details`
- `GET /workouts/sessions?student_id={id}`

---

### 4.3 Prescrever Plano

**Rota:** Bottom sheet em `/students/{id}`

**Descrição:** Configurar prescrição de plano.

**Componentes:**
- Título: "Prescrever para [Nome]"
- **Seção Plano:**
  - Lista de planos disponíveis (radio)
  - Link: "Criar novo plano"
- **Seção Período:**
  - Radio: Início imediato / Agendar
  - Date picker (se agendar)
  - Campo: Duração (semanas)
  - Texto: Data término calculada
- **Seção Modo:**
  - Radio: Presencial / Online / Híbrido
- **Seção Configurações:**
  - Toggle: Requer aceite do aluno
  - Toggle: Preview antes de aceitar
  - Radio: Plano anterior (encerrar/manter/perguntar)
- **Seção Mensagem:**
  - Textarea: Mensagem personalizada
- Botão: "Prescrever" (primary)

**Estados:**
- Default: Nenhum plano selecionado
- Valid: Plano selecionado
- Loading: Prescrevendo

**Ações do Usuário:**
- Selecionar plano
- Configurar período
- Definir opções
- Prescrever

**Dados (API):**
- `GET /plans`
- `POST /workouts/plan-assignments`

---

### 4.4 Aceite/Recusa de Prescrição (Aluno)

**Rota:** Bottom sheet no Home ou notificação

**Descrição:** Aluno revisa e responde à prescrição.

**Componentes:**
- Título: "Novo Plano de Treino"
- Card do plano:
  - Nome
  - Personal
  - Período
  - Objetivo
  - Qtd de treinos
- Mensagem do Personal (se houver)
- Botão: "Ver detalhes do plano"
- Campo Comentário (se recusar)
- Botões:
  - "Recusar" (outlined, destructive)
  - "Aceitar" (primary)

**Estados:**
- Default: Aguardando resposta
- Loading: Processando

**Ações do Usuário:**
- Ver detalhes do plano
- Aceitar prescrição
- Recusar com comentário

**Dados (API):**
- `POST /workouts/plan-assignments/{id}/respond`

---

## 5. Acompanhamento

### 5.1 Home - Treino do Dia

**Rota:** `/home`

**Descrição:** Dashboard principal do aluno.

**Componentes:**
- AppBar: Saudação + Avatar
- Card destaque:
  - "Treino de Hoje"
  - Nome do treino
  - Estimativa de duração
  - Botão: "Iniciar Treino"
- Seção Streak:
  - Dias consecutivos
  - Calendário da semana
- Card Próximos treinos
- Card Progresso resumido
- Notificação de plano pendente (se houver)

**Estados:**
- Loading: Skeleton
- No workout: "Dia de descanso"
- Default: Treino disponível

**Ações do Usuário:**
- Tap "Iniciar" → Tela de treino
- Tap cards → Detalhes
- Aceitar/recusar plano pendente

**Dados (API):**
- `GET /workouts/today`
- `GET /dashboard/student`

---

### 5.2 Execução de Treino

**Rota:** `/workout/{id}/active`

**Descrição:** Tela de treino ativo.

**Componentes:**
- AppBar:
  - Nome do treino
  - Timer (HH:MM:SS)
  - Botão pausar
- Progress bar (exercícios)
- Card exercício atual:
  - Vídeo/GIF demonstrativo
  - Nome do exercício
  - Séries x Reps (meta)
  - Descanso sugerido
  - Tabela de séries:
    - Série | Reps | Carga | Status
  - Steppers para ajustar reps/carga
  - Botão: "Concluir Série"
- Timer de descanso (overlay)
- Seção Feedback:
  - Botões: Gostei | Difícil | Trocar
- Botões navegação:
  - "< Anterior"
  - "Próximo >"
- Botão fixo: "Finalizar Treino"

**Estados:**
- Active: Executando
- Resting: Timer de descanso
- Paused: Treino pausado

**Ações do Usuário:**
- Ajustar reps/carga
- Concluir série
- Pular descanso
- Navegar exercícios
- Dar feedback
- Finalizar treino

**Dados (API):**
- `POST /workouts/sessions`
- `POST /workouts/sessions/{id}/sets`
- `POST /workouts/sessions/{id}/feedback`

---

### 5.3 Timer de Descanso

**Rota:** Overlay em `/workout/{id}/active`

**Descrição:** Contagem regressiva do descanso.

**Componentes:**
- Background blur
- Timer circular grande
- Tempo restante (MM:SS)
- Botões:
  - Pausar/Retomar
  - +30 segundos
  - Pular
- Próximo exercício (preview)

**Estados:**
- Running: Contando
- Paused: Pausado
- Ended: Vibração + som

**Ações do Usuário:**
- Pausar/retomar
- Adicionar tempo
- Pular descanso

---

### 5.4 Finalização com Rating

**Rota:** Bottom sheet em `/workout/{id}/active`

**Descrição:** Resumo e avaliação do treino.

**Componentes:**
- Animação de celebração
- Trophy animado
- Título: "Treino Concluído!"
- Mensagem motivacional
- Estatísticas:
  - Duração
  - Exercícios
  - Séries totais
- Seção Rating:
  - Título: "Como foi seu treino?"
  - 5 estrelas selecionáveis
  - Label do rating selecionado
  - Campo comentário (opcional)
- Conquistas (se houver)
- Botão: "Finalizar"

**Estados:**
- Celebrating: Animação ativa
- Default: Aguardando rating
- Loading: Salvando

**Ações do Usuário:**
- Selecionar rating
- Adicionar comentário
- Finalizar

**Dados (API):**
- `POST /workouts/sessions/{id}/complete`

---

### 5.5 Co-Treino

**Rota:** `/workout/{id}/co-training`

**Descrição:** Sessão de treino supervisionada em tempo real.

**Componentes:**
- AppBar:
  - Indicador "AO VIVO"
  - Nome do aluno/personal
- Split view:
  - **Lado esquerdo:**
    - Vídeo do aluno (opcional)
    - Exercício atual
    - Progresso
    - Botão concluir série
  - **Lado direito:**
    - Chat em tempo real
    - Histórico de mensagens
    - Campo de input
- Painel do Personal (apenas Personal vê):
  - Notas privadas
  - Ajustar carga/reps remotamente

**Estados:**
- Connecting: Conectando
- Live: Sessão ativa
- Disconnected: Reconectando

**Ações do Usuário:**
- Enviar mensagens
- Ajustar exercício (Personal)
- Concluir séries (Aluno)

**Dados (API):**
- WebSocket: `/ws/co-training/{sessionId}`

---

### 5.6 Dashboard Personal

**Rota:** `/home` (context: trainer)

**Descrição:** Visão geral para o Personal.

**Componentes:**
- AppBar: Saudação + Avatar
- Cards de métricas:
  - Total de alunos
  - Treinos da semana
  - Aderência média
- Seção "Alunos - Status":
  - Tabela:
    - Nome | Aderência | Semana | Status | Ação
  - Indicadores visuais (dots coloridos)
- Seção "Alertas":
  - Alunos inativos
  - Pedidos de troca
  - Planos expirando
- Quick actions:
  - Convidar aluno
  - Criar plano
  - Broadcast

**Estados:**
- Loading: Skeleton
- Default: Dados carregados

**Ações do Usuário:**
- Tap aluno → Detalhes
- Tap alerta → Ação específica
- Quick actions

**Dados (API):**
- `GET /dashboard/trainer`
- `GET /alerts`

---

### 5.7 Progresso do Aluno

**Rota:** `/progress`

**Descrição:** Métricas e evolução do aluno.

**Componentes:**
- AppBar: "Meu Progresso"
- Card Streak:
  - Dias consecutivos
  - Recorde pessoal
  - Calendário do mês
- Gráfico de evolução de carga:
  - Seletor de exercício
  - Linha do tempo
  - % de aumento
- Seção Conquistas:
  - Badges desbloqueados
  - Próximas conquistas
- Card Composição Corporal:
  - Peso atual vs inicial
  - Link: "Ver histórico"

**Estados:**
- Loading: Skeleton
- Default: Dados carregados

**Ações do Usuário:**
- Alternar exercícios no gráfico
- Ver conquistas
- Registrar peso

**Dados (API):**
- `GET /progress/stats`
- `GET /achievements`

---

## 6. Notificações

### 6.1 Central de Notificações

**Rota:** `/notifications`

**Descrição:** Lista de todas as notificações.

**Componentes:**
- AppBar: "Notificações" + Badge count
- Tabs: "Todas" | "Não lidas"
- Lista de notificações:
  - Ícone por tipo
  - Título
  - Descrição
  - Timestamp
  - Indicador não lida (dot)
  - Swipe actions: Marcar lida, Excluir
- Empty state
- Link: "Marcar todas como lidas"

**Estados:**
- Loading: Skeleton
- Empty: Ilustração
- Default: Lista

**Ações do Usuário:**
- Tap notificação → Ação específica
- Swipe → Ações rápidas
- Marcar todas como lidas

**Dados (API):**
- `GET /notifications`
- `PUT /notifications/{id}/read`
- `PUT /notifications/read-all`

---

### 6.2 Configurações de Notificações

**Rota:** `/settings/notifications`

**Descrição:** Preferências de notificação.

**Componentes:**
- AppBar: "Notificações"
- **Seção Treinos:**
  - Toggle: Lembrete de treino
    - Seletor: Horário preferido
    - Seletor: Antecedência
  - Toggle: Novo plano
  - Toggle: Atualizações
- **Seção Comunicação:**
  - Toggle: Mensagens do Personal
  - Toggle: Notas e observações
- **Seção Gamificação:**
  - Toggle: Conquistas
  - Toggle: Streaks
  - Toggle: Recordes
- **Seção Pagamentos:**
  - Toggle: Lembretes (não desativável)
- **Seção Modo Não Perturbe:**
  - Toggle: Ativar
  - Time picker: Início
  - Time picker: Fim

**Estados:**
- Loading: Carregando preferências
- Default: Toggles configurados

**Ações do Usuário:**
- Alternar toggles
- Configurar horários

**Dados (API):**
- `GET /users/me/notification-settings`
- `PUT /users/me/notification-settings`

---

### 6.3 Broadcast (Personal)

**Rota:** Bottom sheet ou `/broadcast`

**Descrição:** Enviar mensagem em massa.

**Componentes:**
- Título: "Mensagem em Massa"
- **Seção Destinatários:**
  - Radio: Todos os alunos
  - Radio: Selecionar individualmente
  - Radio: Por status do plano
    - Checkbox: Com plano ativo
    - Checkbox: Sem plano
    - Checkbox: Plano expirando
- Contador: "X alunos selecionados"
- **Seção Mensagem:**
  - Campo: Título
  - Campo: Corpo (textarea)
- **Seção Agendamento:**
  - Radio: Enviar agora
  - Radio: Agendar
    - DateTime picker
- Botão: "Enviar" / "Agendar"

**Estados:**
- Default: Nenhum destinatário
- Valid: Destinatários + mensagem
- Loading: Enviando/Agendando
- Success: Confirmação

**Ações do Usuário:**
- Selecionar destinatários
- Escrever mensagem
- Enviar ou agendar

**Dados (API):**
- `POST /broadcasts`

---

## Anexo: Padrões Visuais

### Estados Padrão

| Estado | Comportamento |
|--------|---------------|
| Loading | Skeleton shimmer |
| Empty | Ilustração + texto + CTA |
| Error | Snackbar ou tela de erro |
| Success | Toast ou animação |

### Componentes Reutilizáveis

- **Avatar**: Imagem ou iniciais, com status dot
- **Card**: Borda sutil, sombra leve, cantos arredondados
- **Bottom Sheet**: Handle bar, cantos superiores arredondados
- **FAB**: Canto inferior direito, gradiente primário
- **Stepper**: Horizontal para wizards, vertical para listas
- **Badge**: Chips coloridos por status

### Cores por Status

| Status | Cor |
|--------|-----|
| Pendente | Warning (amarelo) |
| Aceito/Ativo | Success (verde) |
| Recusado/Error | Destructive (vermelho) |
| Info | Primary (azul) |
| Inativo | Muted (cinza) |
