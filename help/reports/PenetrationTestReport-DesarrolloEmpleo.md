# Relatório de Teste de Penetração: Desarrollo y Empleo CBA

## Informações do Relatório

**Data do Relatório:** 7 de Janeiro de 2026  
**Alvo:** Portal Desarrollo y Empleo - Córdoba  
**URL:** https://desarrolloyempleo.cba.gov.ar/  
**Status:** ✅ Etapa 2 Concluída - Fase 1: Reconhecimento Passivo | 🔄 Próxima: Etapa 3 - Dorking em Mecanismos de Busca  
**Testador:** Equipe de Avaliação de Segurança  
**Última Atualização:** 7 de Janeiro de 2026  

## Índice

1. [Resumo Executivo](#resumo-executivo)
2. [Escopo e Objetivos](#escopo-e-objetivos)  
3. [Descobertas de Vulnerabilidades](#descobertas-de-vulnerabilidades)
   - [Resumo de Vulnerabilidades](#resumo-de-vulnerabilidades)
4. [Resultados de Enumeração de URLs](#resultados-de-enumeração-de-urls)
5. [Fases Detalhadas da Avaliação](#fases-detalhadas-da-avaliação)
   - [Fase 1: Reconhecimento Passivo - Etapa 1: Descoberta de Subdomínios](#fase-1-reconhecimento-passivo---etapa-1-descoberta-de-subdomínios)
   - [Fase 1: Reconhecimento Passivo - Etapa 2: Buscar URLs Históricas](#fase-1-reconhecimento-passivo---etapa-2-buscar-urls-históricas)
6. [Próximos Passos](#próximos-passos)

## Resumo Executivo

**📊 Status da Avaliação:** Teste de penetração em andamento - Fase inicial de reconhecimento passivo.

**📈 Progresso da Avaliação:**
- **Fases Concluídas:** 2 de 21 fases planejadas (9.5% completo)
- **Vulnerabilidades Descobertas:** 0 (avaliação em estágio inicial)
- **Métodos de Teste:** Reconhecimento passivo - Descoberta de subdomínios e URLs históricas concluídas

**Detalhes Técnicos**
```
ALVO DA AVALIAÇÃO:
├── URL Principal: https://desarrolloyempleo.cba.gov.ar/
├── Domínio Base: cba.gov.ar
├── Subdomínio: desarrolloyempleo
├── Tipo: Portal governamental (Ministério de Desenvolvimento Social e Promoção do Empleo)
└── Infraestrutura:
    ├── CDN: AWS CloudFront (dwt8sjddftdpv.cloudfront.net)
    ├── DNS: AWS Route 53
    │   ├── ns-456.awsdns-57.com
    │   ├── ns-1146.awsdns-15.org
    │   ├── ns-1934.awsdns-49.co.uk
    │   └── ns-885.awsdns-46.net
    ├── ASN: 16509 (AMAZON-02 - Amazon.com, Inc.)
    └── IPs: Múltiplos endereços IPv4 e IPv6 na rede AWS
```

### Descobertas Principais

Avaliação em estágio inicial. As descobertas serão documentadas conforme o progresso das fases.

**Status Atual:** A avaliação completou **Etapa 2 (Buscar URLs Históricas)** da Fase 1 (Reconhecimento Passivo), descobrindo **2.651 URLs históricas** e **4 subdomínios** relacionados ao alvo. O reconhecimento passivo está em andamento para mapear a superfície de ataque antes de iniciar testes ativos.

## Escopo e Objetivos

### Objetivo Principal
O objetivo deste teste de penetração é **identificar vulnerabilidades de segurança** no portal Desarrollo y Empleo para fins educacionais e de avaliação.

### Escopo do Teste
- **Aplicação Alvo:** Portal Desarrollo y Empleo
- **URL Principal:** https://desarrolloyempleo.cba.gov.ar/
- **Tipo de Teste:** Teste de Penetração Black-box
- **Metodologia:** Guia de Testes OWASP

### Limitações
- ⚠️ O escopo está **limitado** à aplicação hospedada na URL especificada
- 🎓 Teste conduzido exclusivamente para **fins educacionais**

## Descobertas de Vulnerabilidades

Esta seção conterá uma descrição detalhada de cada vulnerabilidade identificada, seu potencial impacto e etapas recomendadas de remediação.

### Resumo de Vulnerabilidades

| ID | Vulnerabilidade | Severidade | Status |
|----|-----------------|------------|--------|
| - | Nenhuma descoberta ainda | - | 🔄 Em progresso |

## Resultados de Enumeração de URLs

### Resumo de Descoberta

A enumeração de URLs será documentada conforme o progresso das fases de reconhecimento.

## Fases Detalhadas da Avaliação

### Fase 1: Reconhecimento Passivo - Etapa 1: Descoberta de Subdomínios

#### Metodologia
Seguindo o Guia de Comandos de Ethical Hacking, a descoberta de subdomínios foi realizada usando múltiplas ferramentas para consultar diferentes fontes de dados públicas e criar uma lista abrangente de ativos conhecidos.

#### Ferramentas Utilizadas
- **Subfinder v2.6.7:** Ferramenta rápida para descoberta de subdomínios
- **Amass v4.2.0:** Enumeração de subdomínios em modo passivo
- **Target:** cba.gov.ar e desarrolloyempleo.cba.gov.ar

#### Comandos Executados
```bash
# Step 1: Subfinder para descobrir subdomínios do domínio base
subfinder -d cba.gov.ar -o subs.txt

# Step 2: Amass em modo passivo para desarrolloyempleo
amass enum -passive -d desarrolloyempleo.cba.gov.ar -o amass_desarrolloyempleo.txt

# Step 3: Filtrar e combinar resultados relacionados a desarrolloyempleo
grep -i "desarrolloyempleo" subs.txt >> desarrolloyempleo_subs.txt
sort -u desarrolloyempleo_subs.txt -o desarrolloyempleo_subs_unique.txt
```

#### Resultados Detalhados

**📊 RESUMO DA DESCOBERTA DE SUBDOMÍNIOS:**
```
Subfinder Execução:
├── Domínio Alvo: cba.gov.ar
├── Subdomínios Encontrados: 518 subdomínios totais
├── Tempo de Execução: 12 segundos 245 milissegundos
└── Arquivo Gerado: subs.txt

Amass Execução:
├── Domínio Alvo: desarrolloyempleo.cba.gov.ar
├── Modo: Passivo (sem queries diretas ao alvo)
├── Informações Coletadas: DNS, infraestrutura, ASN, netblocks
└── Arquivo Gerado: amass_desarrolloyempleo.txt

Filtragem e Consolidação:
├── Subdomínios Filtrados: 4 subdomínios relacionados a desarrolloyempleo
└── Arquivo Final: desarrolloyempleo_subs_unique.txt
```

**🎯 SUBDOMÍNIOS DESCOBERTOS:**
```
SUBDOMÍNIOS RELACIONADOS A DESARROLLOYEMPLEO:
├── desarrolloyempleo.cba.gov.ar
│   └── Tipo: Domínio principal (produção)
├── desarrolloyempleo.test.cba.gov.ar
│   └── Tipo: Ambiente de teste
├── desarrolloyempleoi.cba.gov.ar
│   └── Tipo: Possível variação/typo
└── dwt8sjddftdpv.cloudfront.net
    └── Tipo: CNAME - CloudFront CDN
```

**🔍 DESCOBERTAS TÉCNICAS:**
```
INFRAESTRUTURA IDENTIFICADA:
├── CDN: AWS CloudFront
│   └── CNAME: dwt8sjddftdpv.cloudfront.net
├── DNS Provider: AWS Route 53
│   ├── ns-456.awsdns-57.com
│   ├── ns-1146.awsdns-15.org
│   ├── ns-1934.awsdns-49.co.uk
│   └── ns-885.awsdns-46.net
├── ASN: 16509 (AMAZON-02 - Amazon.com, Inc.)
└── IPs: Múltiplos endereços IPv4 e IPv6 na rede AWS
```

#### Principais Descobertas
1. **Infraestrutura Cloud:** Domínio usa AWS CloudFront para CDN, indicando infraestrutura moderna
2. **Ambiente de Teste:** Ambiente de teste identificado (desarrolloyempleo.test.cba.gov.ar)
3. **Possível Typo Domain:** Subdomínio com possível erro de digitação pode ser explorado
4. **DNS Configuração:** DNS gerenciado pela AWS Route 53 com múltiplos servidores de nomes

#### Implicações de Segurança
- **Superfície de Ataque:** 4 subdomínios identificados expandem a superfície de ataque
- **Ambiente de Teste:** Ambiente de teste pode ter configurações menos seguras
- **Infraestrutura Cloud:** Uso de AWS indica necessidade de testar configurações de segurança na nuvem
- **CDN:** CloudFront pode ocultar o IP de origem, mas também pode expor configurações incorretas

---

### Fase 1: Reconhecimento Passivo - Etapa 2: Buscar URLs Históricas

#### Metodologia
Seguindo o Guia de Comandos de Ethical Hacking, a busca por URLs históricas foi realizada usando a API do Wayback Machine (Internet Archive) para descobrir URLs antigas que não estão mais vinculadas no site ativo, mas podem ainda estar ativas e vulneráveis.

#### Ferramentas Utilizadas
- **waybackurls v0.1.0:** Ferramenta oficial para buscar URLs históricas do Wayback Machine
- **Fonte:** Internet Archive Wayback Machine, Common Crawl, VirusTotal (se API key configurada)
- **Target:** desarrolloyempleo.cba.gov.ar
- **Instalação:** Repositório clonado de https://github.com/tomnomnom/waybackurls

#### Comandos Executados
```bash
# Comando conforme especificado no Ethical Hacking Command Guide
echo "desarrolloyempleo.cba.gov.ar" | waybackurls > wayback_urls.txt
```

#### Resultados Detalhados

**📊 RESUMO DA BUSCA DE URLs HISTÓRICAS:**
```
waybackurls Execução:
├── Domínio Alvo: desarrolloyempleo.cba.gov.ar
├── URLs Históricas Encontradas: 2.651 URLs únicas
├── Ferramenta: waybackurls v0.1.0 (tomnomnom/waybackurls)
├── Fontes Consultadas:
│   ├── Internet Archive Wayback Machine (CDX API)
│   ├── Common Crawl (index.commoncrawl.org)
│   └── VirusTotal (se API key configurada)
├── Método: Consulta automática a múltiplas fontes
└── Arquivo Gerado: wayback_urls.txt
```

**🎯 DESCOBERTAS IMPORTANTES:**

**1. Arquivos PDF Expostos:**
```
DOCUMENTOS HISTÓRICOS IDENTIFICADOS:
├── wp-content/uploads/2019/04/Formulario-Ofrecimiento-Productos-Textiles-1.pdf
│   └── Tipo: Formulário de oferta de produtos têxteis
└── wp-content/uploads/2019/04/FORMULARIO-DE-INSCRIPCI
    └── Tipo: Formulário de inscrição (truncado)
```

**2. Endpoints .well-known Descobertos:**
```
ENDPOINTS DE METADADOS E SEGURANÇA:
├── /.well-known/security.txt
│   └── Propósito: Arquivo de segurança (contatos de segurança)
├── /.well-known/openid-configuration
│   └── Propósito: Configuração OpenID Connect
├── /.well-known/ai-plugin.json
│   └── Propósito: Plugin de IA (possível integração ChatGPT/Claude)
├── /.well-known/assetlinks.json
│   └── Propósito: Android App Links / Digital Asset Links
├── /.well-known/nodeinfo
│   └── Propósito: Informações do Node (Fediverse/ActivityPub)
└── /.well-known/trust.txt
    └── Propósito: Arquivo de confiança (verificação de propriedade)
```

**3. Páginas e Recursos Históricos:**
```
PÁGINAS DESCOBERTAS:
├── /aws-entrena-argentina/
│   └── Descrição: Página de treinamento AWS
├── /metodologias-agiles/
│   └── Descrição: Página sobre metodologias ágeis
└── /100-polideportivos-sociales/
    └── Descrição: Página de polideportivos sociais
```

**4. Parâmetros e Query Strings:**
```
URLs COM PARÂMETROS IDENTIFICADAS:
├── Parâmetros de Tracking:
│   └── fbclid (Facebook Click ID)
├── Query Strings Históricas:
│   └── Múltiplas variações de parâmetros em URLs antigas
└── Possíveis Endpoints de API:
    └── URLs com padrões de API podem indicar endpoints não documentados
```

**5. Sitemaps e XMLRPC (WordPress):**
```
RECURSOS WORDPRESS IDENTIFICADOS:
├── Sitemaps XML:
│   ├── wp-sitemap.xml
│   ├── wp-sitemap-posts-*.xml
│   ├── wp-sitemap-taxonomies-*.xml
│   └── Múltiplos sitemaps categorizados
└── XMLRPC:
    └── xmlrpc.php?rsd (Really Simple Discovery)
```

#### Principais Descobertas
1. **Documentos Sensíveis:** Formulários históricos podem conter informações sensíveis ou padrões de dados
2. **Endpoints de Segurança:** Arquivos .well-known podem revelar informações sobre configuração de segurança
3. **Páginas Ocultas:** Páginas históricas podem ainda estar ativas mas não vinculadas
4. **Parâmetros Históricos:** URLs antigas podem revelar parâmetros e funcionalidades não documentadas
5. **WordPress Detectado:** Sitemaps e XMLRPC indicam uso de WordPress, expandindo superfície de ataque
6. **Múltiplas Fontes:** waybackurls consulta Wayback Machine, Common Crawl e VirusTotal para cobertura completa

#### Por Que É Útil
Conforme especificado no Ethical Hacking Command Guide, um crawler ativo só encontra o que está atualmente vinculado. O `waybackurls` encontra o que existiu anteriormente consultando o Wayback Machine (e outras fontes como Common Crawl). Isso pode revelar:
- **Endpoints de API esquecidos** que podem não ter as mesmas proteções de segurança
- **Painéis administrativos antigos** que podem ter sido esquecidos mas ainda estão ativos
- **Páginas com parâmetros diferentes** e potencialmente mais vulneráveis
- **Informações sobre a evolução** da aplicação e funcionalidades removidas

#### Implicações de Segurança
- **Superfície de Ataque Expandida:** 2.651 URLs históricas aumentam significativamente a superfície de ataque
- **Endpoints Ocultos:** URLs não vinculadas podem ter menos proteções de segurança
- **Informação Sensível:** Documentos históricos podem conter dados ou padrões úteis para ataques
- **Configuração de Segurança:** Arquivos .well-known podem revelar informações sobre a infraestrutura

---

## Próximos Passos

### Ações Pendentes

#### Fases Concluídas
- [x] **1. DESCOBERTA DE SUBDOMÍNIOS** ✅ **CONCLUÍDA** (4 subdomínios descobertos)
- [x] **2. BUSCAR URLs HISTÓRICAS** ✅ **CONCLUÍDA** (2.651 URLs históricas encontradas)

#### Próxima Fase
- [ ] **3. DORKING EM MECANISMOS DE BUSCA** ⬅️ **PRÓXIMA ETAPA**

#### Fases Planejadas
- [ ] **4. PROBING & FINGERPRINTING**
- [ ] **5. BRUTE-FORCE DE DIRETÓRIOS**
- [ ] **6. COMBINAR & DESDUPLICAR URLs**
- [ ] **7. RECONHECIMENTO VISUAL**
- [ ] **8. CRAWLING PARA ENDPOINTS**
- [ ] **9. BUSCAR SEGREDOS EM ARQUIVOS JAVASCRIPT**
- [ ] **10. SCANNING DE REDE & SERVIÇOS**
- [ ] **11. DESCOBERTA DE ENDPOINTS & PARÂMETROS**
- [ ] **12. DETECÇÃO & SCANNING DE CMS**
- [ ] **13. TESTE DE BRUTE-FORCE DE AUTENTICAÇÃO**
- [ ] **14. BRUTE-FORCE & FUZZING DE VALORES DE PARÂMETROS**
- [ ] **15. TESTE DE BRUTE-FORCE BASEADO EM FORMULÁRIOS**
- [ ] **16. SCANNING AUTOMATIZADO DE VULNERABILIDADES**
- [ ] **17. TESTE DE INJEÇÃO SQL**
- [ ] **18. TESTE DE CROSS-SITE SCRIPTING (XSS)**
- [ ] **19. TESTE DE VULNERABILIDADES ESPECIALIZADAS**
- [ ] **20. BUSCAR EXPLOITS PÚBLICOS**
- [ ] **21. TESTE & VALIDAÇÃO DE PAYLOADS**

#### Validação e Relatórios
- [ ] **Verificar descobertas** das fases concluídas
- [ ] **Executar testes de regressão** após correções
- [ ] **Documentar novas descobertas** conforme o progresso
- [ ] **Atualizar classificações de risco** baseadas em novas informações

---

## Contatos

Para questões sobre este relatório:
- **Email:** security-team@example.com
- **Próxima Data de Atualização:** Após conclusão da Etapa 3

---

**⚠️ Aviso Legal:** Este documento contém informações confidenciais e deve ser tratado de acordo com as políticas de segurança da organização.
