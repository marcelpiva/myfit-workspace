# Plano de Testes - MyFit v1.11.0

## Resumo
Este documento descreve os casos de teste para validar as 14 features implementadas na versão 1.11.0.

---

## 1. Distinção Personal/Aluno no Registro

### 1.1 Tela de Seleção de Tipo
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 1.1.1 | Exibição das opções | Abrir app → Cadastrar | Exibe cards "Personal Trainer" e "Aluno" |
| 1.1.2 | Seleção Personal | Tocar em "Personal Trainer" | Card fica destacado, botão "Continuar" habilitado |
| 1.1.3 | Seleção Aluno | Tocar em "Aluno" | Card fica destacado, botão "Continuar" habilitado |
| 1.1.4 | Navegação Personal | Selecionar Personal → Continuar | Vai para registro com campo CREF visível |
| 1.1.5 | Navegação Aluno | Selecionar Aluno → Continuar | Vai para registro sem campo CREF |

### 1.2 Campo CREF (Personal)
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 1.2.1 | Campo visível | Registro como Personal | Campo CREF aparece abaixo do nome |
| 1.2.2 | CREF opcional | Deixar CREF vazio → Cadastrar | Cadastro funciona sem CREF |
| 1.2.3 | CREF preenchido | Preencher CREF → Cadastrar | CREF salvo no perfil |
| 1.2.4 | Selo verificado | Perfil com CREF | Exibe selo de verificação (futuro) |

---

## 2. Verificação de Email

### 2.1 Fluxo de Verificação
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 2.1.1 | Envio de código | Completar cadastro | Redireciona para tela de verificação, email enviado |
| 2.1.2 | Input de código | Digitar 6 dígitos | Auto-avança entre campos, submete ao completar |
| 2.1.3 | Código correto | Inserir código válido | Sucesso, redireciona para onboarding |
| 2.1.4 | Código incorreto | Inserir código errado | Erro "Código inválido", limpa campos |
| 2.1.5 | Reenviar código | Tocar "Reenviar" | Novo código enviado, cooldown de 60s |
| 2.1.6 | Cooldown ativo | Tentar reenviar antes de 60s | Botão desabilitado, mostra contador |
| 2.1.7 | Pular verificação | Tocar "Verificar depois" | Vai para onboarding sem verificar |

---

## 3. Social Login (Google/Apple)

### 3.1 Google Sign-In
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 3.1.1 | Botão visível | Tela de login/welcome | Botão "Continuar com Google" visível |
| 3.1.2 | Fluxo Google | Tocar botão Google | Abre popup Google, solicita conta |
| 3.1.3 | Novo usuário | Login com email não cadastrado | Cria conta, vai para seleção de tipo |
| 3.1.4 | Usuário existente | Login com email cadastrado | Faz login, vai para home |
| 3.1.5 | Cancelar | Fechar popup Google | Volta para tela anterior |

### 3.2 Apple Sign-In (iOS)
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 3.2.1 | Botão visível (iOS) | Tela de login em iOS | Botão "Continuar com Apple" visível |
| 3.2.2 | Botão oculto (Android) | Tela de login em Android | Botão Apple não aparece |
| 3.2.3 | Fluxo Apple | Tocar botão Apple | Abre sheet nativo Apple |
| 3.2.4 | Com email | Compartilhar email real | Cria conta com email Apple |
| 3.2.5 | Email oculto | Usar "Ocultar meu email" | Cria conta com email relay |

---

## 4. Campo CREF com Selo Verificado

| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 4.1 | Editar CREF | Perfil → Editar → Campo CREF | Campo editável com máscara |
| 4.2 | Formato válido | Inserir "123456-G/SP" | Aceita formato |
| 4.3 | Salvar CREF | Salvar perfil com CREF | CREF persiste no backend |
| 4.4 | Exibir selo | Ver perfil com CREF | Badge de verificação visível |

---

## 5. Compartilhamento via WhatsApp

| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 5.1 | Botão compartilhar | Tela de alunos → Menu convite | Opção "Compartilhar via WhatsApp" |
| 5.2 | Abrir WhatsApp | Tocar compartilhar | Abre WhatsApp com mensagem pré-formatada |
| 5.3 | Mensagem correta | Verificar mensagem | Contém link de convite e texto amigável |
| 5.4 | Sem WhatsApp | Dispositivo sem WhatsApp | Mostra erro ou abre share sheet |

---

## 6. QR Code para Convites

| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 6.1 | Botão QR | Tela de alunos → Botão QR | Abre modal com QR Code |
| 6.2 | QR legível | Escanear QR com outro device | Link correto decodificado |
| 6.3 | Copiar link | Tocar "Copiar link" | Link copiado, toast de confirmação |
| 6.4 | Fechar modal | Tocar fora ou X | Modal fecha |

---

## 7. Sistema de Rascunho para Planos

### 7.1 Auto-Save
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 7.1.1 | Salvar automático | Editar plano, aguardar 30s | Indicador de "salvo" aparece |
| 7.1.2 | Sair sem salvar | Sair do wizard | Pergunta se quer salvar rascunho |
| 7.1.3 | Confirmar salvar | Tocar "Salvar rascunho" | Rascunho salvo, volta para lista |
| 7.1.4 | Descartar | Tocar "Descartar" | Sai sem salvar |

### 7.2 Gerenciamento de Rascunhos
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 7.2.1 | Ver rascunhos | Planos → Botão rascunhos | Sheet com lista de rascunhos |
| 7.2.2 | Continuar rascunho | Tocar em rascunho | Abre wizard com dados restaurados |
| 7.2.3 | Novo plano | Tocar "Novo plano" | Abre wizard vazio |
| 7.2.4 | Limite 10 | Criar 11 rascunhos | Rascunho mais antigo removido |
| 7.2.5 | Deletar rascunho | Swipe ou botão deletar | Rascunho removido da lista |

---

## 8. UI de Aceite/Recusa de Plano Prescrito

### 8.1 Banner de Planos Pendentes
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 8.1.1 | Banner visível | Login como aluno com plano pendente | Banner laranja no topo da home |
| 8.1.2 | Contador | Múltiplos planos pendentes | Badge mostra quantidade |
| 8.1.3 | Sem pendentes | Aluno sem planos pendentes | Banner não aparece |
| 8.1.4 | Tocar banner | Tocar no banner | Abre sheet de revisão |

### 8.2 Sheet de Revisão
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 8.2.1 | Detalhes do plano | Abrir sheet | Mostra nome, trainer, datas, objetivo |
| 8.2.2 | Aceitar | Tocar "Aceitar" | Plano aceito, banner some, toast sucesso |
| 8.2.3 | Recusar | Tocar "Recusar" | Abre campo de motivo |
| 8.2.4 | Recusar com motivo | Preencher motivo → Confirmar | Plano recusado, notifica trainer |
| 8.2.5 | Recusar sem motivo | Deixar vazio → Confirmar | Funciona (motivo opcional) |

---

## 9. Prescrição em Massa

| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 9.1 | Botão batch | Tela de planos do trainer | Botão "Prescrever em massa" visível |
| 9.2 | Abrir sheet | Tocar botão | Sheet com lista de alunos e seletor de plano |
| 9.3 | Selecionar alunos | Tocar em alunos | Checkboxes marcados, contador atualiza |
| 9.4 | Selecionar todos | Tocar "Selecionar todos" | Todos marcados |
| 9.5 | Escolher plano | Dropdown de plano | Lista planos publicados do trainer |
| 9.6 | Definir datas | Pickers de data | Datas opcionais, padrão: hoje |
| 9.7 | Prescrever | Tocar "Prescrever" | Progress indicator, depois resumo |
| 9.8 | Resumo sucesso | Todos prescritos | "X alunos prescritos com sucesso" |
| 9.9 | Resumo parcial | Alguns falharam | Lista sucessos e falhas |

---

## 10. Histórico de Versões do Plano

### 10.1 Visualização
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 10.1.1 | Botão histórico | Detalhes do plano prescrito | Botão "Histórico" visível |
| 10.1.2 | Lista versões | Tocar histórico | Sheet com lista de versões |
| 10.1.3 | Sem versões | Plano nunca alterado | Mensagem "Sem alterações" |
| 10.1.4 | Detalhes versão | Ver item da lista | Data, autor, descrição da mudança |

### 10.2 Comparação
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 10.2.1 | Selecionar A | Tocar versão | Badge "A" aparece |
| 10.2.2 | Selecionar B | Tocar segunda versão | Badge "B" aparece, botão "Comparar" |
| 10.2.3 | Ver diff | Tocar "Comparar" | Tela de diff com mudanças |
| 10.2.4 | Tipos de mudança | Verificar diff | Verde=adicionado, Vermelho=removido, Amarelo=modificado |
| 10.2.5 | Voltar lista | Tocar "Lista" | Volta para lista de versões |

---

## 11. Modo Não Perturbe (DND)

| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 11.1 | Toggle DND | Configurações → Notificações | Toggle "Modo Não Perturbe" |
| 11.2 | Ativar DND | Ligar toggle | Time pickers aparecem |
| 11.3 | Horário início | Tocar "Início" | Time picker abre |
| 11.4 | Horário fim | Tocar "Fim" | Time picker abre |
| 11.5 | Salvar | Definir horários | Horários salvos |
| 11.6 | Notificação no DND | Receber notif no horário DND | Notificação silenciada |
| 11.7 | Fora do DND | Receber notif fora do horário | Notificação normal |

---

## 12. Lembretes Automáticos de Convite (Backend/Celery)

> **Nota:** Estes testes requerem acesso ao backend e manipulação de datas.

| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 12.1 | Lembrete 3 dias | Criar convite, esperar 3 dias | Email enviado ao convidado |
| 12.2 | Lembrete 7 dias | Convite pendente há 7 dias | Notificação ao trainer |
| 12.3 | Lembrete 14 dias | Convite pendente há 14 dias | Email final ao convidado |
| 12.4 | Expiração | Convite expira | Notificação ao trainer |
| 12.5 | Aceito antes | Aceitar convite antes de 3 dias | Nenhum lembrete enviado |

---

## 13. Onboarding Guiado Pós-Cadastro

### 13.1 Fluxo Personal Trainer
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 13.1.1 | Tela welcome | Cadastrar como Personal | Tela de boas-vindas com features |
| 13.1.2 | Convidar aluno | Avançar | Tela com opções QR/Link |
| 13.1.3 | Criar plano | Avançar | Tela explicando criação de planos |
| 13.1.4 | Templates | Avançar | Tela com chips de templates |
| 13.1.5 | Concluir | Avançar | Tela de sucesso, botão "Dashboard" |
| 13.1.6 | Pular | Tocar "Pular" em qualquer etapa | Vai direto para org selector |

### 13.2 Fluxo Aluno
| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 13.2.1 | Welcome | Cadastrar como Aluno | Tela de personalização |
| 13.2.2 | Objetivo | Avançar | Lista de objetivos (6 opções) |
| 13.2.3 | Outro objetivo | Selecionar "Outro" | Campo de texto aparece |
| 13.2.4 | Experiência | Avançar | 3 níveis (Iniciante/Intermediário/Avançado) |
| 13.2.5 | Dados físicos | Avançar | Campos peso/altura/idade |
| 13.2.6 | Frequência | Avançar | Grid 1-7 vezes por semana |
| 13.2.7 | Lesões | Avançar | Chips de lesões + campo texto |
| 13.2.8 | Concluir | Avançar | Tela sucesso, botão "Começar" |

---

## 14. Lembretes Inteligentes de Treino (Backend/Celery)

> **Nota:** Estes testes requerem acesso ao backend.

| # | Caso de Teste | Passos | Resultado Esperado |
|---|---------------|--------|-------------------|
| 14.1 | Lembrete manhã | Aluno com plano, não treinou | Notificação com mensagem variada |
| 14.2 | Já treinou | Aluno já treinou hoje | Não recebe lembrete |
| 14.3 | DND ativo | Horário dentro do DND | Não recebe lembrete |
| 14.4 | Streak protection | 19h-22h, não treinou | Mensagem de streak |
| 14.5 | Inativo 3+ dias | Sem treino há 3 dias | Mensagem de retorno |
| 14.6 | Mensagens variadas | Múltiplos dias | Mensagens diferentes |

---

## Checklist de Regressão

Além dos testes específicos, verificar que funcionalidades existentes continuam funcionando:

- [ ] Login/Logout normal
- [ ] Criar treino do zero
- [ ] Executar treino
- [ ] Ver progresso
- [ ] Chat com trainer
- [ ] Notificações push
- [ ] Navegação entre abas
- [ ] Pull to refresh
- [ ] Modo escuro/claro

---

## Ambiente de Teste

| Item | Valor |
|------|-------|
| **iOS Simulador** | iPhone 15 Pro (iOS 17) |
| **iOS Físico** | iPhone 12+ com iOS 16+ |
| **Android Emulador** | Pixel 6 (API 34) |
| **Android Físico** | Android 10+ |
| **Backend** | Staging environment |
| **Celery** | Worker rodando com Redis |

---

## Critérios de Aprovação

- [ ] Todos os testes críticos (marcados com *) passando
- [ ] Nenhum crash ou ANR
- [ ] Performance aceitável (< 2s para operações)
- [ ] UI responsiva em diferentes tamanhos de tela
- [ ] Dark mode funcionando corretamente
- [ ] Acessibilidade básica (labels, contraste)

---

*Gerado em: 2026-01-25*
*Versão: myfit-app v1.11.0 / myfit-api v0.6.1*
