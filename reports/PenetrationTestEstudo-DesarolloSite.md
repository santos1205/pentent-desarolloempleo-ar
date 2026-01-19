# Curso de Teste de Penetração: Desarrollo y Empleo CBA
## Material Didático Completo - Do Iniciante ao Expert

**Data de Criação:** 17 de Janeiro de 2026  
**Baseado em:** PenetrationTestReport-DesarrolloEmpleo.md  
**Nível:** Iniciante → Intermediário → Avançado → Expert  
**Idioma:** Português Brasileiro

---

## AVISO LEGAL E ÉTICO

**Este material é destinado EXCLUSIVAMENTE para:**
- ✅ Aprendizado e educação em segurança da informação
- ✅ Testes de penetração autorizados
- ✅ Ambientes de teste controlados
- ✅ Pesquisa de segurança com autorização escrita

**NÃO utilize estas técnicas em:**
- ❌ Sistemas sem autorização expressa
- ❌ Ambientes de produção não autorizados
- ❌ Atividades ilegais ou não éticas

**Responsabilidade:** O uso destas técnicas é de responsabilidade exclusiva do usuário. Sempre obtenha autorização escrita antes de executar qualquer teste.

---

## Sumário do Curso

Este curso está organizado em **9 módulos progressivos**, do nível iniciante ao expert. Cada módulo contém explicações detalhadas, analogias práticas, exemplos reais baseados no teste de penetração do portal Desarrollo y Empleo e exercícios práticos.

### Estrutura dos Módulos

**🔵 NÍVEL INICIANTE:**
- **[Módulo 1: Fundamentos de Teste de Penetração](#módulo-1-fundamentos-de-teste-de-penetração)**
  - O que é teste de penetração
  - Metodologias e frameworks (OWASP, PTES)
  - Ética e legalidade
  - Tipos de teste (Black-box, White-box, Gray-box)
  - Fases de um teste de penetração

**🟢 NÍVEL BÁSICO:**
- **[Módulo 2: Reconhecimento Passivo](#módulo-2-reconhecimento-passivo)**
  - Descoberta de subdomínios
  - Busca de URLs históricas (Wayback Machine)
  - Dorking em mecanismos de busca
  - OSINT (Open Source Intelligence)

**🟡 NÍVEL INTERMEDIÁRIO:**
- **[Módulo 3: Reconhecimento Ativo Básico](#módulo-3-reconhecimento-ativo-básico)**
  - Probing e fingerprinting
  - Directory brute-forcing
  - Consolidação e desduplicação de URLs
  - Reconhecimento visual

- **[Módulo 4: Reconhecimento Ativo Avançado](#módulo-4-reconhecimento-ativo-avançado)**
  - Crawling para descoberta de endpoints
  - Análise de arquivos JavaScript
  - Scanning de rede e serviços
  - Identificação de tecnologias

**🟠 NÍVEL INTERMEDIÁRIO-AVANÇADO:**
- **[Módulo 5: Enumeração e Descoberta](#módulo-5-enumeração-e-descoberta)**
  - Descoberta de endpoints e parâmetros
  - Detecção e scanning de CMS
  - Enumeração de usuários e plugins
  - Identificação de versões de software

**🔴 NÍVEL AVANÇADO:**
- **[Módulo 6: Testes de Autenticação e Brute-Force](#módulo-6-testes-de-autenticação-e-brute-force)**
  - Teste de brute-force de autenticação
  - Fuzzing de valores de parâmetros
  - Bypass de autenticação
  - Rate limiting e proteções

- **[Módulo 7: Análise de Vulnerabilidades Básicas](#módulo-7-análise-de-vulnerabilidades-básicas)**
  - Scanning automatizado de vulnerabilidades
  - Teste de injeção SQL
  - Teste de Cross-Site Scripting (XSS)
  - Análise de security headers

**⚫ NÍVEL EXPERT:**
- **[Módulo 8: Vulnerabilidades Especializadas e Exploits](#módulo-8-vulnerabilidades-especializadas-e-exploits)**
  - Teste de upload de arquivos
  - Descoberta de buckets S3
  - Descoberta de repositórios Git
  - Busca de exploits públicos

- **[Módulo 9: Análise, Relatório e Mitigação](#módulo-9-análise-relatório-e-mitigação)**
  - Análise crítica de resultados
  - Criação de cadeias de exploração
  - Documentação de vulnerabilidades
  - Recomendações de remediação

---

## Como Usar Este Material

1. **Siga a ordem dos módulos** - Cada módulo constrói sobre o anterior
2. **Complete os exercícios práticos** - A prática é essencial para o aprendizado
3. **Pause entre módulos** - Reflita sobre o que aprendeu antes de avançar
4. **Use ambiente de teste** - Sempre teste em ambientes autorizados
5. **Faça perguntas** - Se tiver dúvidas, revise o módulo anterior

---

# Módulo 1: Fundamentos de Teste de Penetração
## Nível: Iniciante | Duração Estimada: 3-4 horas

---

## Objetivos de Aprendizado

Ao final deste módulo, você será capaz de:
- ✅ Entender o que é teste de penetração e sua importância
- ✅ Conhecer as principais metodologias e frameworks
- ✅ Compreender os aspectos éticos e legais
- ✅ Diferenciar tipos de teste (Black-box, White-box, Gray-box)
- ✅ Entender as fases de um teste de penetração
- ✅ Preparar-se para executar testes de forma ética e legal

---

## 1.1 O Que É Teste de Penetração?

### Explicação Simples

Imagine que você é um **testador de segurança** contratado para verificar se uma casa está segura. Você não vai quebrar a casa, mas vai tentar encontrar todas as formas possíveis de entrar nela - portas, janelas, telhado, etc. - para que o dono possa corrigir as falhas antes que um verdadeiro ladrão as encontre.

No mundo da tecnologia, um **teste de penetração** (ou "pentest") é exatamente isso: uma avaliação de segurança autorizada que simula um ataque real para identificar vulnerabilidades antes que atacantes mal-intencionados as encontrem.

### Analogia do Mundo Real

**Analogia da Casa:**
- **Teste de Penetração:** Você é contratado para testar a segurança da casa
- **Autorização:** O dono da casa te dá permissão por escrito
- **Metodologia:** Você segue um checklist sistemático (portas, janelas, alarmes)
- **Relatório:** Você documenta todas as falhas encontradas
- **Remediação:** O dono corrige as falhas baseado no seu relatório

### Definição Técnica

**Teste de Penetração (Penetration Testing):**
É um método de avaliação de segurança que simula ataques reais em sistemas, redes ou aplicações para identificar vulnerabilidades de segurança que poderiam ser exploradas por atacantes.

### Por Que Fazer Testes de Penetração?

1. **Identificar Vulnerabilidades Antes dos Atacantes:**
   - Encontrar falhas antes que sejam exploradas maliciosamente
   - Reduzir o risco de violações de dados

2. **Validar Controles de Segurança:**
   - Verificar se as proteções implementadas realmente funcionam
   - Testar a eficácia de firewalls, WAFs, etc.

3. **Cumprir Requisitos Regulatórios:**
   - Muitas regulamentações exigem testes de segurança regulares
   - Exemplos: PCI-DSS, GDPR, LGPD

4. **Melhorar a Postura de Segurança:**
   - Entender onde estão os pontos fracos
   - Priorizar correções baseado em risco

5. **Educação e Conscientização:**
   - Mostrar à equipe os riscos reais
   - Treinar equipes de resposta a incidentes

### Exemplo Prático: Nosso Caso de Estudo

No teste de penetração do portal **Desarrollo y Empleo**, descobrimos:

**Descoberta 1: XMLRPC Exposto (DE-001)**
- **O que é:** Interface remota do WordPress acessível publicamente
- **Risco:** Permite ataques de brute-force e amplificação de DDoS
- **Impacto:** 16 sites WordPress afetados na infraestrutura governamental
- **Analogia:** É como ter uma porta dos fundos sempre aberta, permitindo que qualquer pessoa tente abrir a fechadura principal

**Descoberta 2: REST API Exposta (DE-002)**
- **O que é:** API do WordPress expõe informações sobre usuários e posts
- **Risco:** Enumeração de usuários e informações sensíveis
- **Impacto:** 19 usuários WordPress enumerados
- **Analogia:** É como ter uma lista telefônica pública com nomes e endereços de todos os moradores

**Descoberta 3: Brute-Force de Senhas (DE-009)**
- **O que é:** Parâmetro `password` permite tentar senhas de posts protegidos
- **Risco:** Acesso não autorizado a conteúdo confidencial
- **Impacto:** CVSS 7.5 (Alta severidade)
- **Analogia:** É como ter uma fechadura que permite tentar infinitas chaves sem bloqueio

---

## 1.2 Metodologias e Frameworks

### O Que É uma Metodologia?

Uma **metodologia** é um conjunto de processos e práticas padronizadas que guiam como realizar um teste de penetração de forma sistemática e completa.

### Analogia

Pense em uma metodologia como um **"manual de instruções"** para montar um móvel. Sem o manual, você pode tentar montar, mas pode esquecer peças importantes ou fazer na ordem errada. Com o manual, você segue passos organizados e garante que nada seja esquecido.

### Principais Metodologias

#### 1. OWASP (Open Web Application Security Project)

**O que é:** Framework focado em segurança de aplicações web

**Estrutura:**
- **OWASP Top 10:** Lista das 10 vulnerabilidades web mais críticas
- **OWASP Testing Guide:** Guia completo de testes
- **OWASP Web Security Testing Guide (WSTG):** Metodologia detalhada

**Fases OWASP:**
1. Information Gathering (Coleta de Informações)
2. Configuration and Deployment Management Testing
3. Identity Management Testing
4. Authentication Testing
5. Authorization Testing
6. Session Management Testing
7. Input Validation Testing
8. Error Handling Testing
9. Cryptography Testing
10. Business Logic Testing
11. Client-Side Testing

**Quando usar:** Testes de aplicações web, especialmente WordPress, APIs REST, etc.

**Exemplo do nosso caso:**
- Usamos metodologia OWASP no teste do portal
- Focamos em Information Gathering, Authentication Testing, Input Validation
- Identificamos vulnerabilidades do OWASP Top 10 (Information Disclosure, Authentication Bypass)

#### 2. PTES (Penetration Testing Execution Standard)

**O que é:** Padrão abrangente para execução de testes de penetração

**Estrutura em 7 Fases:**
1. **Pre-engagement Interactions** (Interações Pré-Engajamento)
2. **Intelligence Gathering** (Coleta de Inteligência)
3. **Threat Modeling** (Modelagem de Ameaças)
4. **Vulnerability Analysis** (Análise de Vulnerabilidades)
5. **Exploitation** (Exploração)
6. **Post Exploitation** (Pós-Exploração)
7. **Reporting** (Relatório)

**Quando usar:** Testes completos de infraestrutura, aplicações e redes

**Exemplo do nosso caso:**
- Seguimos fases do PTES (adaptadas para web)
- Intelligence Gathering: Descoberta de subdomínios, URLs históricas
- Vulnerability Analysis: Scanning automatizado, testes manuais
- Reporting: Documentação detalhada de 10 vulnerabilidades

#### 3. NIST Cybersecurity Framework

**O que é:** Framework do governo americano para gestão de riscos de segurança

**Funções Principais:**
- Identify (Identificar)
- Protect (Proteger)
- Detect (Detectar)
- Respond (Responder)
- Recover (Recuperar)

**Quando usar:** Organizações que precisam alinhar segurança com padrões governamentais

### Comparação de Metodologias

| Metodologia | Foco | Melhor Para |
|------------|------|-------------|
| **OWASP** | Aplicações Web | Sites, APIs, aplicações web modernas |
| **PTES** | Testes Completos | Infraestrutura completa, redes, sistemas |
| **NIST** | Gestão de Riscos | Organizações grandes, compliance |

### Qual Metodologia Usar?

**Para Aplicações Web (como nosso caso):**
- **Primária:** OWASP Testing Guide
- **Complementar:** PTES (fases de Intelligence Gathering e Vulnerability Analysis)

**Para Infraestrutura Completa:**
- **Primária:** PTES
- **Complementar:** NIST Framework

**Para Compliance:**
- **Primária:** NIST ou padrão específico (PCI-DSS, ISO 27001)
- **Complementar:** OWASP ou PTES

---

## 1.3 Ética e Legalidade em Testes de Penetração

### Por Que Ética É Crítica?

Testar sistemas sem autorização é **CRIME** na maioria dos países. Mesmo com boas intenções, você pode:
- Ser processado criminalmente
- Ser preso
- Ter que pagar multas pesadas (milhares ou milhões)
- Arruinar sua carreira profissional
- Ser banido de trabalhar em segurança

### Analogia Legal

**Analogia da Casa:**
- **Com Autorização:** Você é um testador de segurança contratado - LEGAL ✅
- **Sem Autorização:** Você é um invasor tentando entrar - ILEGAL ❌

**No Mundo Digital:**
- **Com Autorização:** Você é um pentester contratado - LEGAL ✅
- **Sem Autorização:** Você é um hacker criminoso - ILEGAL ❌

### Princípios Fundamentais do Hacker Ético

#### 1. Autorização Escrita (Written Authorization)

**O que é:** Permissão explícita e documentada para realizar o teste

**O que deve conter:**
- Nome e contato do autorizador
- Escopo do teste (o que pode e não pode ser testado)
- Período de validade
- Limites e restrições
- Contatos de emergência

**Exemplo de Autorização:**
```
AUTORIZAÇÃO PARA TESTE DE PENETRAÇÃO

Eu, [Nome], [Cargo], autorizo [Nome do Pentester] a realizar
teste de penetração no sistema [URL/IP] no período de 
[Data Inicial] a [Data Final].

Escopo: Aplicação web https://exemplo.com
Limitações: Apenas testes não destrutivos
Contato de Emergência: [Telefone/Email]

Assinatura: ________________
Data: ________________
```

**No nosso caso:**
- Teste realizado para fins educacionais
- Documentado como "teste conduzido exclusivamente para fins educacionais"
- Escopo limitado à aplicação especificada

#### 2. Responsabilidade (Responsibility)

**O que significa:**
- Você é responsável por todos os seus atos
- Não cause danos desnecessários
- Reporte vulnerabilidades de forma responsável
- Mantenha confidencialidade

**Exemplo:**
- Se você encontrar uma vulnerabilidade crítica, não a explore além do necessário para provar sua existência
- Não acesse ou modifique dados além do necessário
- Não cause interrupção de serviços

#### 3. Confidencialidade (Confidentiality)

**O que significa:**
- Não divulgue informações sensíveis descobertas
- Mantenha dados seguros
- Siga acordos de não divulgação (NDA)
- Proteja informações de clientes

**Exemplo:**
- Não publique vulnerabilidades antes que sejam corrigidas
- Não compartilhe credenciais encontradas
- Não divulgue informações de usuários

#### 4. Legalidade (Legality)

**O que significa:**
- Conheça as leis do seu país/região
- Respeite termos de serviço
- Não teste sistemas sem autorização
- Entenda implicações legais

**Leis Relevantes (Brasil):**
- **Lei 12.737/2012 (Lei Carolina Dieckmann):** Crimes informáticos
- **Código Penal:** Invasão de dispositivo informático (Art. 154-A)
- **LGPD:** Proteção de dados pessoais

**Leis Relevantes (Internacional):**
- **CFAA (EUA):** Computer Fraud and Abuse Act
- **Computer Misuse Act (UK):** Lei britânica de crimes informáticos
- **GDPR (Europa):** Regulamento geral de proteção de dados

### Cenários Legais vs Ilegais

#### ✅ LEGAL:

1. **Testar seu próprio sistema:**
   - Seu próprio servidor, site ou aplicação
   - Ambiente de laboratório próprio

2. **Testar com autorização escrita:**
   - Cliente contratou você para testar
   - Autorização explícita e documentada

3. **Programas de Bug Bounty autorizados:**
   - HackerOne, Bugcrowd, etc.
   - Regras claras e autorização

4. **Ambientes de teste públicos:**
   - DVWA, WebGoat, HackTheBox (com permissão)
   - Laboratórios de prática autorizados

#### ❌ ILEGAL:

1. **Testar sistemas sem permissão:**
   - Sites de outras pessoas
   - Sistemas governamentais sem autorização
   - Qualquer sistema que você não possui ou não tem permissão

2. **Explorar vulnerabilidades encontradas:**
   - Acessar dados não autorizados
   - Modificar sistemas
   - Causar interrupção de serviços

3. **Divulgar vulnerabilidades sem responsabilidade:**
   - Publicar antes de reportar
   - Não dar tempo para correção
   - Expor informações sensíveis

### Responsável Disclosure (Divulgação Responsável)

**O que é:** Processo ético de reportar vulnerabilidades encontradas

**Processo Padrão:**

1. **Descobrir a Vulnerabilidade:**
   - Documentar todos os detalhes
   - Capturar evidências (screenshots, logs)
   - Não explorar além do necessário

2. **Reportar ao Proprietário:**
   - Encontrar contato de segurança
   - Enviar relatório detalhado
   - Fornecer informações suficientes para reproduzir

3. **Aguardar Resposta:**
   - Dar tempo para análise (geralmente 7-14 dias)
   - Fazer follow-up se necessário
   - Ser paciente e profissional

4. **Timeline de Divulgação:**
   - **Dia 1-7:** Reporte inicial
   - **Dia 30:** Verificação de status
   - **Dia 60:** Follow-up se necessário
   - **Dia 90:** Após correção, pode divulgar (se autorizado)

**Exemplo de Timeline:**
```
Dia 1:  Você descobre a vulnerabilidade DE-009
Dia 2:  Você reporta ao proprietário do sistema
Dia 7:  Você recebe confirmação de recebimento
Dia 30: Você verifica se foi corrigida
Dia 60: Você faz follow-up se necessário
Dia 90: Após correção, você pode divulgar (com permissão)
```

### Checklist de Ética

Antes de iniciar qualquer teste, verifique:

- [ ] Tenho autorização escrita explícita?
- [ ] O escopo do teste está claramente definido?
- [ ] Entendo as limitações e restrições?
- [ ] Tenho contatos de emergência?
- [ ] Sei como reportar vulnerabilidades encontradas?
- [ ] Entendo as implicações legais?
- [ ] Estou preparado para manter confidencialidade?

---

## 1.4 Tipos de Teste de Penetração

### Classificação por Nível de Informação

Os testes de penetração são classificados pelo **nível de informação** que o testador possui sobre o sistema alvo.

### Analogia da Casa

**Black-box:** Você está do lado de fora, sem nenhuma informação sobre a casa
**White-box:** Você tem a planta da casa, chaves de todas as portas, e conhece todos os sistemas
**Gray-box:** Você tem algumas informações (talvez a planta, mas não as chaves)

### 1. Black-Box Testing (Teste de Caixa Preta)

**Definição:** Teste realizado **sem conhecimento prévio** do sistema alvo.

**O que o testador sabe:**
- Apenas a URL ou endereço IP público
- Informações públicas disponíveis

**O que o testador NÃO sabe:**
- Código-fonte
- Arquitetura interna
- Configurações de servidor
- Credenciais de acesso

**Vantagens:**
- ✅ Simula ataque real de um atacante externo
- ✅ Testa visibilidade externa do sistema
- ✅ Identifica informações expostas publicamente

**Desvantagens:**
- ❌ Pode não encontrar vulnerabilidades internas
- ❌ Mais demorado (precisa descobrir tudo)
- ❌ Pode não ter acesso a áreas protegidas

**Quando usar:**
- Testes de segurança externa
- Validação de controles perimetrais
- Simulação de atacante real

**Exemplo do nosso caso:**
- Teste do portal Desarrollo y Empleo foi **Black-box**
- Começamos apenas com a URL: `https://desarrolloyempleo.cba.gov.ar/`
- Tivemos que descobrir tudo: subdomínios, tecnologias, endpoints, etc.

### 2. White-Box Testing (Teste de Caixa Branca)

**Definição:** Teste realizado **com conhecimento completo** do sistema alvo.

**O que o testador sabe:**
- Código-fonte completo
- Arquitetura e design
- Configurações de servidor
- Credenciais de acesso
- Documentação técnica

**Vantagens:**
- ✅ Cobertura completa (encontra mais vulnerabilidades)
- ✅ Mais rápido (não precisa descobrir informações)
- ✅ Testa lógica de negócio interna
- ✅ Pode acessar áreas protegidas

**Desvantagens:**
- ❌ Não simula ataque real externo
- ❌ Pode não testar controles perimetrais
- ❌ Requer acesso privilegiado

**Quando usar:**
- Testes de código durante desenvolvimento
- Validação de lógica de negócio
- Testes de segurança interna
- Code review de segurança

**Exemplo:**
- Desenvolvedor testa sua própria aplicação
- Equipe de segurança interna testa sistemas da empresa
- Auditoria de código-fonte

### 3. Gray-Box Testing (Teste de Caixa Cinza)

**Definição:** Teste realizado **com conhecimento parcial** do sistema alvo.

**O que o testador sabe:**
- Algumas informações (documentação, arquitetura básica)
- Talvez credenciais de usuário comum (não admin)
- Informações públicas + algumas internas

**O que o testador NÃO sabe:**
- Código-fonte completo
- Configurações detalhadas
- Credenciais privilegiadas

**Vantagens:**
- ✅ Balanceia realismo e eficiência
- ✅ Simula atacante com conhecimento parcial
- ✅ Testa tanto aspectos externos quanto internos

**Desvantagens:**
- ❌ Pode não ser tão completo quanto white-box
- ❌ Pode não ser tão realista quanto black-box

**Quando usar:**
- Testes com usuário autenticado
- Validação de controles de acesso
- Testes de aplicações com login

**Exemplo:**
- Teste com credenciais de usuário comum
- Teste de API com token de acesso básico
- Teste de aplicação com documentação parcial

### Comparação Visual

```
BLACK-BOX                    GRAY-BOX                    WHITE-BOX
┌─────────┐                 ┌─────────┐                 ┌─────────┐
│         │                 │    ╱╲   │                 │  ╱───╲  │
│    ?    │                 │   ╱  ╲  │                 │ ╱     ╲ │
│    ?    │                 │  ╱ ?  ╲ │                 ││ Código ││
│    ?    │                 │ ╱_____╲ │                 ││  Fonte ││
└─────────┘                 └─────────┘                 ││ Config ││
                                                          ││  Docs  ││
Sem Informação              Informação Parcial            └─────────┘
                                                          Info Completa
```

### Qual Tipo Escolher?

**Para Teste Externo (nosso caso):**
- **Black-box** é o mais apropriado
- Simula atacante real sem conhecimento interno

**Para Desenvolvimento:**
- **White-box** durante desenvolvimento
- **Black-box** antes de produção

**Para Aplicações com Login:**
- **Gray-box** com credenciais de usuário comum
- Testa controles de acesso

---

## 1.5 Fases de um Teste de Penetração

### Visão Geral

Um teste de penetração segue uma **sequência lógica de fases**, cada uma construindo sobre a anterior. É como uma investigação: você começa coletando informações básicas e gradualmente aprofunda até encontrar vulnerabilidades.

### Analogia da Investigação

**Fase 1 - Reconhecimento:** Como um detetive coletando informações sobre um suspeito
**Fase 2 - Scanning:** Como verificar portas e janelas de uma casa
**Fase 3 - Enumeração:** Como mapear todos os cômodos da casa
**Fase 4 - Exploração:** Como tentar abrir portas e janelas
**Fase 5 - Relatório:** Como documentar todas as descobertas

### Fases Detalhadas (Baseadas no Nosso Caso)

#### Fase 1: Reconhecimento Passivo

**O que é:** Coletar informações **sem interagir diretamente** com o alvo

**Objetivo:** Descobrir informações públicas disponíveis

**Técnicas:**
- Descoberta de subdomínios
- Busca de URLs históricas (Wayback Machine)
- Dorking em mecanismos de busca
- OSINT (Open Source Intelligence)

**Resultados no nosso caso:**
- ✅ 4 subdomínios descobertos
- ✅ 2.651 URLs históricas encontradas
- ✅ Endpoint AWS Cognito identificado
- ✅ Infraestrutura CloudFront mapeada

**Analogia:** É como pesquisar informações sobre uma pessoa na internet antes de conhecê-la pessoalmente.

**Tempo estimado:** 10-20% do tempo total do teste

#### Fase 2: Reconhecimento Ativo

**O que é:** Interagir **diretamente** com o alvo para descobrir informações

**Objetivo:** Mapear a superfície de ataque e identificar tecnologias

**Técnicas:**
- Probing e fingerprinting
- Directory brute-forcing
- Crawling de endpoints
- Análise de JavaScript
- Scanning de rede

**Resultados no nosso caso:**
- ✅ 3.384 endpoints descobertos
- ✅ 19 tecnologias identificadas
- ✅ 7 plugins WordPress enumerados
- ✅ 19 usuários WordPress descobertos

**Analogia:** É como caminhar ao redor de uma casa, verificando portas, janelas e sistemas de segurança.

**Tempo estimado:** 30-40% do tempo total do teste

#### Fase 3: Autenticação e Teste de Brute-Force

**O que é:** Testar mecanismos de autenticação e parâmetros

**Objetivo:** Identificar falhas em autenticação e autorização

**Técnicas:**
- Brute-force de credenciais
- Fuzzing de parâmetros
- Teste de rate limiting
- Bypass de autenticação

**Resultados no nosso caso:**
- ✅ AWS Cognito identificado como endpoint de autenticação
- ✅ Proteções ativas contra brute-force encontradas
- ✅ **DE-009 confirmada:** Brute-force de senhas de posts protegidos

**Analogia:** É como testar diferentes chaves em uma fechadura para ver se alguma funciona.

**Tempo estimado:** 15-20% do tempo total do teste

#### Fase 4: Análise de Vulnerabilidades e Exploração

**O que é:** Identificar e explorar vulnerabilidades específicas

**Objetivo:** Confirmar vulnerabilidades e avaliar impacto

**Técnicas:**
- Scanning automatizado (Nuclei, Nikto)
- Teste de SQL Injection
- Teste de XSS
- Teste de vulnerabilidades especializadas
- Busca de exploits públicos

**Resultados no nosso caso:**
- ✅ 10 vulnerabilidades confirmadas
- ✅ 6 vulnerabilidades potenciais identificadas
- ✅ **DE-010:** Credentials disclosure encontrada
- ✅ WAF bloqueando SQLi e XSS (proteções funcionando)

**Analogia:** É como usar ferramentas especializadas para encontrar pontos fracos específicos na segurança.

**Tempo estimado:** 25-30% do tempo total do teste

#### Fase 5: Relatório e Documentação

**O que é:** Documentar todas as descobertas e recomendações

**Objetivo:** Fornecer relatório acionável para correção

**Conteúdo:**
- Resumo executivo
- Vulnerabilidades detalhadas
- Evidências e screenshots
- Recomendações de remediação
- Análise de risco

**Resultados no nosso caso:**
- ✅ Relatório completo com 10 vulnerabilidades
- ✅ CVSS scores calculados
- ✅ Recomendações específicas fornecidas
- ✅ Análise crítica de gaps metodológicos

**Analogia:** É como escrever um relatório de inspeção detalhado para o dono da casa.

**Tempo estimado:** 10-15% do tempo total do teste

### Fluxo Visual das Fases

```
FASE 1: Reconhecimento Passivo
    │
    ├──> Descoberta de Subdomínios
    ├──> URLs Históricas
    └──> Dorking
    │
    ▼
FASE 2: Reconhecimento Ativo
    │
    ├──> Probing & Fingerprinting
    ├──> Directory Brute-Forcing
    ├──> Crawling
    ├──> Análise JavaScript
    └──> Network Scanning
    │
    ▼
FASE 3: Autenticação & Brute-Force
    │
    ├──> Brute-Force de Credenciais
    └──> Fuzzing de Parâmetros
    │
    ▼
FASE 4: Análise de Vulnerabilidades
    │
    ├──> Scanning Automatizado
    ├──> SQL Injection
    ├──> XSS
    ├──> Vulnerabilidades Especializadas
    └──> Exploits Públicos
    │
    ▼
FASE 5: Relatório
    │
    ├──> Documentação
    ├──> Análise de Risco
    └──> Recomendações
```

### Distribuição de Tempo

```
┌─────────────────────────────────────┐
│ Fase 1: Reconhecimento Passivo     │ ████ 15%
│ Fase 2: Reconhecimento Ativo       │ ████████████ 35%
│ Fase 3: Autenticação & Brute-Force │ ███████ 18%
│ Fase 4: Análise de Vulnerabilidades│ ██████████ 27%
│ Fase 5: Relatório                  │ ████ 15%
└─────────────────────────────────────┘
```

---

## Exercícios Práticos do Módulo 1

### Exercício 1: Entendendo Metodologias (Nível: Fácil)

**Objetivo:** Familiarizar-se com diferentes metodologias de teste

**Tarefas:**
1. Acesse o site https://owasp.org/www-project-web-security-testing-guide/
2. Explore a estrutura do OWASP Testing Guide
3. Identifique as fases principais
4. Compare com as fases do PTES (pesquise online)

**Perguntas:**
1. Quantas fases principais tem o OWASP Testing Guide?
2. Qual metodologia é mais adequada para aplicações web?
3. Qual metodologia é mais adequada para infraestrutura completa?

**Solução Esperada:**
- OWASP tem foco em aplicações web
- PTES tem foco em testes completos de infraestrutura
- Para aplicações web, OWASP é mais específico

### Exercício 2: Ética e Legalidade (Nível: Fácil)

**Objetivo:** Entender cenários legais vs ilegais

**Cenários - Classifique como LEGAL ou ILEGAL:**

1. Você foi contratado por uma empresa para testar seu site. Você tem autorização escrita.
   - **Resposta:** ✅ LEGAL

2. Você encontrou um site vulnerável e quer "provar" testando sem autorização.
   - **Resposta:** ❌ ILEGAL

3. Você está testando seu próprio servidor em casa.
   - **Resposta:** ✅ LEGAL

4. Você participa de um programa de bug bounty autorizado (HackerOne).
   - **Resposta:** ✅ LEGAL

5. Você testa o site de um concorrente "só para ver se é seguro".
   - **Resposta:** ❌ ILEGAL

### Exercício 3: Tipos de Teste (Nível: Médio)

**Objetivo:** Aplicar conhecimento sobre tipos de teste

**Cenários - Identifique o tipo de teste:**

1. Você recebeu apenas a URL do site e precisa descobrir tudo sozinho.
   - **Resposta:** Black-box

2. Você tem acesso ao código-fonte e documentação completa.
   - **Resposta:** White-box

3. Você tem credenciais de usuário comum, mas não de administrador.
   - **Resposta:** Gray-box

4. Você está testando uma aplicação durante desenvolvimento.
   - **Resposta:** White-box (geralmente)

5. Você está simulando um atacante externo sem conhecimento interno.
   - **Resposta:** Black-box

### Exercício 4: Fases do Teste (Nível: Médio)

**Objetivo:** Entender a sequência lógica das fases

**Tarefa:** Ordene as fases na sequência correta:

- [ ] Análise de Vulnerabilidades
- [ ] Reconhecimento Passivo
- [ ] Relatório
- [ ] Autenticação e Brute-Force
- [ ] Reconhecimento Ativo

**Sequência Correta:**
1. Reconhecimento Passivo
2. Reconhecimento Ativo
3. Autenticação e Brute-Force
4. Análise de Vulnerabilidades
5. Relatório

### Exercício 5: Criar Autorização de Teste (Nível: Médio)

**Objetivo:** Praticar criação de documento de autorização

**Tarefa:** Crie um documento de autorização para teste de penetração incluindo:
- Nome do autorizador
- Escopo do teste
- Período de validade
- Limitações
- Contatos de emergência

**Template Sugerido:**
```
AUTORIZAÇÃO PARA TESTE DE PENETRAÇÃO

Autorizador: [Nome, Cargo, Empresa]
Testador: [Nome]
Sistema Alvo: [URL/IP]
Período: [Data Inicial] a [Data Final]

Escopo: [Descrição detalhada]
Limitações: [O que não pode ser testado]
Contato de Emergência: [Telefone/Email]

Assinatura: ________________
Data: ________________
```

---

## Resumo do Módulo 1

### Conceitos Chave Aprendidos

1. **Teste de Penetração:** Avaliação de segurança autorizada que simula ataques reais
2. **Metodologias:** OWASP (web), PTES (completo), NIST (governança)
3. **Ética:** Sempre obter autorização escrita antes de testar
4. **Tipos de Teste:** Black-box (sem info), White-box (info completa), Gray-box (info parcial)
5. **Fases:** Reconhecimento Passivo → Ativo → Autenticação → Vulnerabilidades → Relatório

### Próximos Passos

Agora que você entende os fundamentos, está pronto para o **Módulo 2: Reconhecimento Passivo**, onde aprenderá:
- Como descobrir subdomínios
- Como buscar URLs históricas
- Como usar dorking em mecanismos de busca
- Técnicas de OSINT (Open Source Intelligence)

---

## Perguntas Frequentes (FAQ)

**P: Preciso de certificação para fazer testes de penetração?**  
R: Não é obrigatório, mas certificações como CEH, OSCP, ou GWAPT ajudam muito na carreira.

**P: Posso testar qualquer site se eu reportar as vulnerabilidades?**  
R: NÃO! Sempre obtenha autorização escrita. Testar sem permissão é ilegal, mesmo com boas intenções.

**P: Qual metodologia devo usar para começar?**  
R: Para aplicações web, comece com OWASP Testing Guide. É a mais acessível e específica.

**P: Quanto tempo leva um teste de penetração completo?**  
R: Depende do escopo. Para uma aplicação web média, geralmente 1-2 semanas. Para infraestrutura completa, pode levar meses.

**P: Preciso saber programação para fazer pentest?**  
R: Não necessariamente para testes básicos, mas conhecimento de programação (Python, Bash) é muito útil para automação e scripts customizados.

---

## Checklist de Conclusão do Módulo 1

Antes de avançar para o Módulo 2, certifique-se de que você:

- [ ] Entende o que é teste de penetração e sua importância
- [ ] Conhece as principais metodologias (OWASP, PTES)
- [ ] Compreende a importância da ética e legalidade
- [ ] Sabe diferenciar tipos de teste (Black-box, White-box, Gray-box)
- [ ] Entende as fases de um teste de penetração
- [ ] Completou pelo menos 3 dos 5 exercícios práticos
- [ ] Sabe criar um documento de autorização básico

---

**Parabéns! Você completou o Módulo 1!**

Agora você tem uma base sólida nos fundamentos de teste de penetração. Quando estiver pronto, podemos continuar com o **Módulo 2: Reconhecimento Passivo**.

**Você tem alguma dúvida sobre o Módulo 1? Deseja continuar para o Módulo 2?**
