# Relatório de Teste de Penetração: Desarrollo y Empleo CBA

## Informações do Relatório

**Data do Relatório:** 7 de Janeiro de 2026  
**Alvo:** Portal Desarrollo y Empleo - Córdoba  
**URL:** https://desarrolloyempleo.cba.gov.ar/  
**Status:** ✅ Etapa 8 Concluída - Fase 2: Reconhecimento Ativo | 6 Vulnerabilidades Identificadas | Próxima: Etapa 9 - Buscar Segredos em Arquivos JavaScript  
**Testador:** Equipe de Avaliação de Segurança  
**Última Atualização:** 7 de Janeiro de 2026  

## Índice

1. [Resumo Executivo](#resumo-executivo)
2. [Escopo e Objetivos](#escopo-e-objetivos)  
3. [Descobertas de Vulnerabilidades](#descobertas-de-vulnerabilidades)
   - [Resumo de Vulnerabilidades](#resumo-de-vulnerabilidades)
   - [DE-001: XMLRPC.php Exposto em Múltiplos Sites WordPress](#de-001-xmlrpcphp-exposto-em-múltiplos-sites-wordpress)
   - [DE-002: WordPress REST API (wp-json) Exposta](#de-002-wordpress-rest-api-wp-json-exposta)
   - [DE-003: Informação de Versão de Software Exposta](#de-003-informação-de-versão-de-software-exposta)
   - [DE-004: jQuery Migrate Versão Antiga (3.4.1)](#de-004-jquery-migrate-versão-antiga-341)
   - [DE-005: Endpoint OAuth2/AWS Cognito Exposto](#de-005-endpoint-oauth2aws-cognito-exposto)
   - [DE-006: Superfície de Ataque Expandida (3.384 Endpoints)](#de-006-superfície-de-ataque-expandida-3384-endpoints)
4. [Resultados de Enumeração de URLs](#resultados-de-enumeração-de-urls)
5. [Fases Detalhadas da Avaliação](#fases-detalhadas-da-avaliação)
   - [Fase 1: Reconhecimento Passivo - Etapa 1: Descoberta de Subdomínios](#fase-1-reconhecimento-passivo---etapa-1-descoberta-de-subdomínios)
   - [Fase 1: Reconhecimento Passivo - Etapa 2: Buscar URLs Históricas](#fase-1-reconhecimento-passivo---etapa-2-buscar-urls-históricas)
   - [Fase 1: Reconhecimento Passivo - Etapa 3: Dorking em Mecanismos de Busca](#fase-1-reconhecimento-passivo---etapa-3-dorking-em-mecanismos-de-busca)
   - [Fase 2: Reconhecimento Ativo - Etapa 4: Probing & Fingerprinting](#fase-2-reconhecimento-ativo---etapa-4-probing--fingerprinting)
   - [Fase 2: Reconhecimento Ativo - Etapa 5: Directory Brute-Forcing](#fase-2-reconhecimento-ativo---etapa-5-directory-brute-forcing)
   - [Fase 2: Reconhecimento Ativo - Etapa 6: Combinar & Desduplicar URLs](#fase-2-reconhecimento-ativo---etapa-6-combinar--desduplicar-urls)
   - [Fase 2: Reconhecimento Ativo - Etapa 7: Reconhecimento Visual](#fase-2-reconhecimento-ativo---etapa-7-reconhecimento-visual)
   - [Fase 2: Reconhecimento Ativo - Etapa 8: Crawling para Endpoints](#fase-2-reconhecimento-ativo---etapa-8-crawling-para-endpoints)
6. [Informações para Testes de Autenticação](#informações-para-testes-de-autenticação-etapas-13-e-15)
7. [Próximos Passos](#próximos-passos)

## Resumo Executivo

**📊 Status da Avaliação:** Teste de penetração em andamento - Fase inicial de reconhecimento passivo.

**📈 Progresso da Avaliação:**
- **Fases Concluídas:** 8 de 21 fases planejadas (38.1% completo)
- **Vulnerabilidades Descobertas:** 6 vulnerabilidades identificadas (1 Baixa, 5 Médias)
- **Métodos de Teste:** Reconhecimento passivo concluído (3 etapas) | Reconhecimento ativo em progresso (Etapas 4-8 concluídas)

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

**Status Atual:** A avaliação completou **Fase 1 (Reconhecimento Passivo)** e **Etapas 4-8 (Reconhecimento Ativo)** da Fase 2. Resultados: **4 subdomínios** descobertos, **2.651 URLs históricas** encontradas, **endpoint AWS Cognito** identificado, **1 host ativo** mapeado com **19 tecnologias** detectadas, **10.690 requisições de directory brute-forcing** executadas (1 resultado 200, 8 redirecionamentos, 10.533 arquivos protegidos com 403), **13.302 URLs únicas** consolidadas, **reconhecimento visual** concluído com **76 screenshots** capturados, e **3.384 endpoints** descobertos via crawling. **6 vulnerabilidades** identificadas: XMLRPC exposto (16 sites), WordPress REST API exposta, informações de versão expostas, jQuery Migrate desatualizado, endpoint OAuth2 exposto, e superfície de ataque expandida. Próxima etapa: **Buscar Segredos em Arquivos JavaScript**.

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

Esta seção contém uma descrição detalhada de cada vulnerabilidade identificada, seu potencial impacto e etapas recomendadas de remediação.

### DE-001: XMLRPC.php Exposto em Múltiplos Sites WordPress

**ID:** DE-001  
**Severidade:** 🟡 Média  
**Categoria:** Information Disclosure / Brute-Force Vector  
**CVSS Score:** 5.3 (AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N)

#### Descrição
O endpoint `xmlrpc.php` está acessível publicamente em **16 sites WordPress** identificados durante o crawling, incluindo o site principal `desarrolloyempleo.cba.gov.ar`. O XMLRPC é uma interface remota do WordPress que pode ser explorada para ataques de brute-force e amplificação de DDoS.

#### Sites Afetados
```
1. https://desarrolloyempleo.cba.gov.ar/xmlrpc.php?rsd
2. https://www.cba.gov.ar/xmlrpc.php?rsd
3. https://estadistica.cba.gov.ar/xmlrpc.php?rsd
4. https://cordobadigital.cba.gov.ar/xmlrpc.php?rsd
5. https://registrocivil.cba.gov.ar/xmlrpc.php?rsd
6. https://prensa.cba.gov.ar/xmlrpc.php?rsd
7. https://ambiente.cba.gov.ar/xmlrpc.php?rsd
8. https://puentesdigitales.cba.gov.ar/xmlrpc.php?rsd
9. https://estandardigital.cba.gov.ar/xmlrpc.php?rsd
10. https://hacemosescuela.cba.gov.ar/xmlrpc.php?rsd
11. https://cultura.cba.gov.ar/xmlrpc.php?rsd
12. https://deportes.cba.gov.ar/xmlrpc.php?rsd
13. https://ceprocor.cba.gov.ar/xmlrpc.php?rsd
14. https://consejodelamagistratura.cba.gov.ar/xmlrpc.php?rsd
15. https://compraspublicas.cba.gov.ar/xmlrpc.php?rsd
16. https://gestionabierta.cba.gov.ar/xmlrpc.php?rsd
```

#### Impacto
- **Brute-Force Amplificado:** XMLRPC permite múltiplas tentativas de login em uma única requisição HTTP
- **DDoS Amplification:** Pode ser usado para amplificar ataques DDoS
- **Reconhecimento:** Expõe informações sobre a instalação WordPress
- **Ataques Remotos:** Permite publicação remota de conteúdo (se habilitado)

#### Evidências
- Endpoint acessível via `?rsd` (Really Simple Discovery)
- Resposta XML contendo informações da instalação WordPress
- Múltiplos sites afetados na infraestrutura governamental

#### Recomendações de Remediação
1. **Desabilitar XMLRPC** (recomendado se não for necessário):
   ```apache
   # Adicionar ao .htaccess
   <Files xmlrpc.php>
       Order allow,deny
       Deny from all
   </Files>
   ```

2. **Restringir Acesso por IP** (se XMLRPC for necessário):
   ```apache
   <Files xmlrpc.php>
       Order deny,allow
       Deny from all
       Allow from [IPs autorizados]
   </Files>
   ```

3. **Usar Plugin de Segurança:** Instalar plugin que desabilita XMLRPC (ex: Disable XML-RPC)

4. **Monitoramento:** Implementar logging e alertas para tentativas de acesso ao XMLRPC

#### Referências
- [OWASP: XMLRPC Security](https://owasp.org/www-community/vulnerabilities/XMLRPC_Security)
- [WordPress Codex: XMLRPC](https://codex.wordpress.org/XML-RPC_Support)

---

### DE-002: WordPress REST API (wp-json) Exposta

**ID:** DE-002  
**Severidade:** 🟡 Média  
**Categoria:** Information Disclosure  
**CVSS Score:** 5.3 (AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N)

#### Descrição
A WordPress REST API está acessível publicamente através do endpoint `/wp-json/`, expondo informações sobre posts, páginas, usuários e estrutura do site. Foram identificados **múltiplos endpoints wp-json** durante o crawling, incluindo endpoints de oembed e API v2.

#### Endpoints Identificados
```
- https://desarrolloyempleo.cba.gov.ar/wp-json/
- https://desarrolloyempleo.cba.gov.ar/wp-json/oembed/1.0/embed
- https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/{id}
- https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/pages/{id}
```

#### Impacto
- **Information Disclosure:** Expõe IDs de posts, páginas, estrutura do site
- **User Enumeration:** Pode permitir enumeração de usuários (se não protegido)
- **Reconhecimento:** Facilita mapeamento da estrutura do WordPress
- **Possível Escalação:** Se combinado com outras vulnerabilidades

#### Evidências
- Endpoint `/wp-json/` retorna informações sobre a API disponível
- Endpoints `/wp-json/wp/v2/posts/{id}` expõem IDs de posts
- Endpoints `/wp-json/oembed/` expõem metadados de conteúdo

#### Recomendações de Remediação
1. **Restringir Acesso à REST API:**
   ```php
   // Adicionar ao functions.php do tema
   add_filter('rest_authentication_errors', function($result) {
       if (!empty($result)) {
           return $result;
       }
       if (!is_user_logged_in()) {
           return new WP_Error('rest_cannot_access', 'REST API access restricted', array('status' => 403));
       }
       return $result;
   });
   ```

2. **Desabilitar REST API para Usuários Não Autenticados:**
   - Usar plugin de segurança (ex: Disable REST API)
   - Manter apenas endpoints necessários habilitados

3. **Rate Limiting:** Implementar rate limiting para endpoints públicos

4. **Monitoramento:** Logar acessos à REST API

#### Referências
- [WordPress REST API Handbook](https://developer.wordpress.org/rest-api/)
- [OWASP: API Security](https://owasp.org/www-project-api-security/)

---

### DE-003: Informação de Versão de Software Exposta

**ID:** DE-003  
**Severidade:** 🟢 Baixa  
**Categoria:** Information Disclosure  
**CVSS Score:** 3.1 (AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N)

#### Descrição
Informações detalhadas sobre versões de software foram identificadas através de fingerprinting, incluindo WordPress 6.8.3, Elementor 3.30.4, e outras tecnologias. Esta informação facilita ataques direcionados usando exploits conhecidos.

#### Versões Identificadas
```
WordPress: 6.8.3
Elementor: 3.30.4
Elementor Pro: 3.30.1
Ivory Search: 5.5.11
Site Kit: 1.168.0
jQuery: 3.7.1
jQuery Migrate: 3.4.1
PHP: (versão não especificada, mas presente)
MySQL: (presente)
```

#### Impacto
- **Targeted Attacks:** Ataques direcionados usando exploits conhecidos para versões específicas
- **Reconhecimento:** Facilita pesquisa de vulnerabilidades conhecidas
- **Exploit Selection:** Permite seleção de exploits apropriados

#### Evidências
- Headers HTTP expõem versões
- Arquivos JavaScript/CSS contêm números de versão
- WordPress generator tag expõe versão

#### Recomendações de Remediação
1. **Remover Generator Tags:**
   ```php
   // Adicionar ao functions.php
   remove_action('wp_head', 'wp_generator');
   ```

2. **Obfuscar Versões em Arquivos:**
   - Remover números de versão de arquivos CSS/JS
   - Usar hashes em vez de versões

3. **Headers de Segurança:**
   - Não expor versões em headers HTTP
   - Usar headers genéricos

4. **Atualização Regular:** Manter software atualizado para reduzir risco de exploits conhecidos

---

### DE-004: jQuery Migrate Versão Antiga (3.4.1)

**ID:** DE-004  
**Severidade:** 🟡 Média  
**Categoria:** Outdated Software  
**CVSS Score:** 5.3 (AV:N/AC:L/PR:N/UI:R/S:U/C:L/I:L/A:N)

#### Descrição
O site utiliza jQuery Migrate versão 3.4.1, que é uma versão antiga. jQuery Migrate é usado para compatibilidade com versões antigas do jQuery, mas versões desatualizadas podem conter vulnerabilidades conhecidas.

#### Impacto
- **Vulnerabilidades Conhecidas:** Versões antigas podem ter CVEs não corrigidos
- **Compatibilidade:** Dependência de código legado
- **Segurança:** Possível vetor para XSS ou outras vulnerabilidades client-side

#### Evidências
```
https://desarrolloyempleo.cba.gov.ar/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1
```

#### Recomendações de Remediação
1. **Atualizar jQuery Migrate:** Atualizar para versão mais recente (se necessário)
2. **Remover jQuery Migrate:** Se possível, remover dependência e atualizar código legado
3. **Auditoria de Código:** Verificar se código legado ainda é necessário
4. **Monitoramento:** Verificar CVEs para versão em uso

---

### DE-005: Endpoint OAuth2/AWS Cognito Exposto

**ID:** DE-005  
**Severidade:** 🟡 Média  
**Categoria:** Information Disclosure / Authentication  
**CVSS Score:** 5.3 (AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N)

#### Descrição
Endpoint de autenticação AWS Cognito foi identificado durante dorking, expondo informações sobre o fluxo OAuth2/OpenID Connect, incluindo Client ID e redirect URI. Esta informação pode ser usada para reconhecimento e possíveis ataques de autenticação.

#### Informações Expostas
```
Domínio Cognito: mj-cba-gov-ar.auth.us-east-2.amazoncognito.com
Client ID: 515ap1iticksk0ci68kr822dfm
Redirect URI: https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse
Região AWS: us-east-2 (Ohio, USA)
Protocolo: OAuth2/OpenID Connect
```

#### Impacto
- **Reconhecimento:** Expõe infraestrutura de autenticação
- **OAuth2 Attacks:** Possível manipulação de parâmetros OAuth2
- **Account Enumeration:** Pode permitir enumeração de usuários
- **Brute-Force:** Endpoint de login identificado para ataques

#### Evidências
- Endpoint descoberto via dorking em mecanismos de busca
- URL completa com parâmetros OAuth2 exposta
- Documentação completa em `dorking-discoveries.md`

#### Recomendações de Remediação
1. **Validar Redirect URI:** Garantir validação estrita do redirect_uri
2. **Rate Limiting:** Implementar rate limiting no endpoint de login
3. **Monitoramento:** Logar tentativas de autenticação suspeitas
4. **CSRF Protection:** Verificar proteção adequada do parâmetro state
5. **Obfuscação:** Considerar não indexar endpoint de login em mecanismos de busca

#### Referências
- Documentação completa: `reports/dorking-discoveries.md`
- [OWASP: OAuth2 Security](https://owasp.org/www-community/vulnerabilities/OAuth2_Security)

---

### DE-006: Superfície de Ataque Expandida (3.384 Endpoints)

**ID:** DE-006  
**Severidade:** 🟡 Média  
**Categoria:** Information Disclosure  
**CVSS Score:** 5.3 (AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N)

#### Descrição
O crawling automatizado identificou **3.384 endpoints únicos** através do site principal e sites relacionados. Esta superfície de ataque expandida aumenta o risco de descoberta de vulnerabilidades e endpoints não documentados.

#### Estatísticas
```
Total de Endpoints Descobertos: 3.384
Fonte: Katana crawling (depth 3)
Alvo Principal: https://desarrolloyempleo.cba.gov.ar
Sites Relacionados: Múltiplos subdomínios cba.gov.ar
```

#### Impacto
- **Endpoints Ocultos:** Pode revelar endpoints não documentados
- **Superfície de Ataque:** Maior número de pontos de entrada potenciais
- **Reconhecimento:** Mapeamento completo da estrutura do site
- **Vulnerabilidades:** Maior probabilidade de encontrar vulnerabilidades

#### Evidências
- Arquivo `crawled_endpoints.txt` contém 3.384 URLs
- Endpoints incluem recursos estáticos, APIs, e páginas dinâmicas
- Múltiplos sites WordPress interconectados

#### Recomendações de Remediação
1. **Revisão de Endpoints:** Revisar todos os endpoints descobertos
2. **Documentação:** Documentar endpoints legítimos
3. **Remoção:** Remover endpoints não utilizados ou obsoletos
4. **Proteção:** Proteger endpoints sensíveis com autenticação
5. **Monitoramento:** Monitorar acesso a endpoints não documentados

---

### Resumo de Vulnerabilidades

| ID | Vulnerabilidade | Severidade | Status |
|----|-----------------|------------|--------|
| DE-001 | XMLRPC.php Exposto em Múltiplos Sites WordPress | 🟡 Média | 🔄 Ativa |
| DE-002 | WordPress REST API (wp-json) Exposta | 🟡 Média | 🔄 Ativa |
| DE-003 | Informação de Versão de Software Exposta | 🟢 Baixa | 🔄 Ativa |
| DE-004 | jQuery Migrate Versão Antiga (3.4.1) | 🟡 Média | 🔄 Ativa |
| DE-005 | Endpoint OAuth2/AWS Cognito Exposto | 🟡 Média | 🔄 Ativa |
| DE-006 | Superfície de Ataque Expandida (3.384 Endpoints) | 🟡 Média | 🔄 Ativa |

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

### Fase 1: Reconhecimento Passivo - Etapa 3: Dorking em Mecanismos de Busca

#### Metodologia
Seguindo o Guia de Comandos de Ethical Hacking, o dorking em mecanismos de busca foi realizado usando operadores avançados de busca (Google, Bing, DuckDuckGo) para encontrar informações não intencionalmente públicas sem enviar tráfego direto aos servidores do alvo.

#### Ferramentas Utilizadas
- **Google Search:** Operadores avançados (site:, inurl:, intitle:, filetype:, ext:)
- **Bing Search:** Operadores similares ao Google
- **DuckDuckGo:** Busca alternativa para resultados únicos
- **Target:** desarrolloyempleo.cba.gov.ar e subdomínios relacionados

#### Comandos Executados
```bash
# Exemplos de dorking executados:
site:desarrolloyempleo.cba.gov.ar inurl:admin
site:desarrolloyempleo.cba.gov.ar inurl:login OR intitle:"login"
site:desarrolloyempleo.cba.gov.ar ext:env OR ext:ini OR ext:conf
site:desarrolloyempleo.cba.gov.ar filetype:pdf OR filetype:doc
# ... (ver temp-dork.md para lista completa)
```

#### Resultados Detalhados

**📊 RESUMO DO DORKING:**
```
Dorking Execução:
├── Mecanismos Consultados: Google, Bing, DuckDuckGo
├── Categorias Testadas: 13 categorias diferentes
├── Descobertas Importantes: 1 endpoint crítico identificado
└── Arquivo de Comandos: temp-dork.md
```

**🎯 DESCOBERTA PRINCIPAL:**

**1. Endpoint de Autenticação AWS Cognito:**
```
URL ENCONTRADA:
https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/login?client_id=515ap1iticksk0ci68kr822dfm&redirect_uri=https%3A%2F%2Fdesarrolloyempleo.cba.gov.ar%2Foauth2%2Fidpresponse&response_type=code&scope=openid&state=[...]&prompt=login&display=page

INFORMAÇÕES EXTRAÍDAS:
├── Domínio Cognito: mj-cba-gov-ar.auth.us-east-2.amazoncognito.com
├── Região AWS: us-east-2 (Ohio, USA)
├── Client ID: 515ap1iticksk0ci68kr822dfm
├── Redirect URI: https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse
├── Protocolo: OAuth2/OpenID Connect
└── Tipo: Página de login de autenticação
```

#### Principais Descobertas
1. **Infraestrutura de Autenticação:** Sistema usa AWS Cognito para gerenciamento de autenticação
2. **Endpoint de Callback:** `/oauth2/idpresponse` identificado como endpoint de retorno OAuth2
3. **Client ID Exposto:** Client ID visível na URL (normal, mas útil para reconhecimento)
4. **Superfície de Ataque:** Novo domínio identificado expande a superfície de ataque

#### Implicações de Segurança
- **Ponto de Entrada:** Endpoint de login identificado para testes de autenticação
- **OAuth2 Flow:** Fluxo OAuth2/OpenID Connect mapeado
- **Possíveis Vetores:** Brute-force, account enumeration, OAuth2 misconfiguration
- **Documentação Detalhada:** Ver `dorking-discoveries.md` para análise completa

#### Próximas Ações Recomendadas
1. Validar se endpoint ainda está ativo
2. Analisar configuração OAuth2 (endpoint `.well-known/openid-configuration`)
3. Testar funcionalidades de autenticação (Etapa 13 do guia)
4. Verificar se redirect_uri pode ser manipulado (Open Redirect)

---

### Fase 2: Reconhecimento Ativo - Etapa 4: Probing & Fingerprinting

#### Metodologia
Seguindo o Guia de Comandos de Ethical Hacking, o probing e fingerprinting foi realizado para identificar quais subdomínios descobertos estão ativos e quais tecnologias estão sendo executadas. Esta é a primeira fase de reconhecimento ativo, envolvendo interação direta com os alvos.

#### Ferramentas Utilizadas
- **httpx:** Ferramenta rápida para verificar hosts HTTP/HTTPS ativos e obter informações detalhadas
- **whatweb:** Análise aprofundada da stack tecnológica de um único alvo
- **Target:** Subdomínios descobertos na Etapa 1

#### Comandos Executados
```bash
# Step 1: Preparar lista de subdomínios (remover linhas com CNAME e duplicatas)
grep -v "FQDN\|cname_record" help/reports/desarrolloyempleo_subs_unique.txt | sort -u > subdomains_clean.txt

# Step 2: Encontrar servidores web ativos dos subdomínios
cat subdomains_clean.txt | httpx -ports 80,443,8080,8443 -threads 200 -timeout 10s > live_hosts.txt

# Step 3: Obter informações detalhadas (status code, título, tecnologia, IP)
cat live_hosts.txt | httpx -sc -td -ip -title -tech-detect -status-code > enriched_hosts.txt

# Step 4: Filtrar resultados por status code
cat enriched_hosts.txt | grep "200" > hosts_200.txt  # Páginas funcionais
cat enriched_hosts.txt | grep "403" > hosts_403.txt  # Páginas proibidas (interessantes)
cat enriched_hosts.txt | grep "301\|302" > hosts_redirects.txt  # Redirecionamentos

# Step 5: Análise detalhada com whatweb (para alvos principais)
whatweb https://desarrolloyempleo.cba.gov.ar -v
whatweb https://desarrolloyempleo.test.cba.gov.ar -v
```

#### Resultados Detalhados

**📊 RESUMO DO PROBING & FINGERPRINTING:**
```
httpx Execução:
├── Subdomínios Testados: 4 subdomínios únicos
├── Portas Verificadas: 80, 443, 8080, 8443
├── Threads: 200
├── Timeout: 10 segundos
└── Arquivo Gerado: live_hosts.txt

Enrichment Execução:
├── Informações Coletadas:
│   ├── Status Code (sc)
│   ├── Título da Página (title)
│   ├── IP Address (ip)
│   ├── Tecnologias Detectadas (tech-detect)
│   └── Status Code Detalhado (status-code)
└── Arquivo Gerado: enriched_hosts.txt
```

**🎯 SUBDOMÍNIOS TESTADOS:**
```
SUBDOMÍNIOS PARA PROBING:
├── desarrolloyempleo.cba.gov.ar
│   └── Tipo: Domínio principal (produção)
├── desarrolloyempleo.test.cba.gov.ar
│   └── Tipo: Ambiente de teste
├── desarrolloyempleoi.cba.gov.ar
│   └── Tipo: Possível variação/typo
└── dwt8sjddftdpv.cloudfront.net
    └── Tipo: CNAME - CloudFront CDN (não testado diretamente)
```

#### Principais Descobertas

**📊 RESUMO DOS RESULTADOS:**
```
httpx Execução:
├── Subdomínios Testados: 4 subdomínios únicos (3 domínios + 1 CNAME)
├── Portas Verificadas: 80, 443, 8080, 8443
├── Hosts Ativos Encontrados: 1 host ativo
├── Status Codes Identificados: 200 (OK)
└── Arquivo Gerado: live_hosts.txt

Enrichment Execução:
├── Informações Coletadas:
│   ├── Status Code: 200
│   ├── Título: "Ministerio de Desarrollo Social y Promoción del Empleo – Sitio Oficial del Ministerio de Desarrollo Social y Promoción del Empleo"
│   ├── IP Address: 2600:9000:294e:fe00:19:2b8f:6cc0:93a1 (IPv6)
│   └── Tecnologias Detectadas: 19 tecnologias identificadas
└── Arquivo Gerado: enriched_hosts.txt
```

**🎯 HOSTS ATIVOS IDENTIFICADOS:**
```
HOST ATIVO:
├── https://desarrolloyempleo.cba.gov.ar
│   ├── Status: 200 OK
│   ├── IP: 2600:9000:294e:fe00:19:2b8f:6cc0:93a1 (IPv6)
│   ├── Título: Ministerio de Desarrollo Social y Promoción del Empleo
│   └── Infraestrutura:
│       ├── Amazon ALB (Application Load Balancer)
│       ├── Amazon CloudFront (CDN)
│       ├── Amazon Web Services
│       └── WordPress 6.8.3
```

**🔍 TECNOLOGIAS DETECTADAS:**
```
STACK TECNOLÓGICA IDENTIFICADA:
├── Servidor Web:
│   ├── Amazon ALB (Application Load Balancer)
│   └── Amazon CloudFront (CDN)
├── CMS:
│   ├── WordPress 6.8.3
│   ├── Elementor 3.30.4 (Page Builder)
│   └── Ivory Search 5.5.11 (Search Plugin)
├── Banco de Dados:
│   └── MySQL
├── Linguagem:
│   └── PHP
├── Plugins WordPress:
│   ├── Site Kit 1.168.0 (Google Analytics)
│   └── Ivory Search 5.5.11
├── Bibliotecas JavaScript:
│   ├── jQuery
│   ├── jQuery Migrate 3.4.1
│   ├── Swiper (Carousel)
│   └── imagesLoaded 5.0.0
├── Fontes:
│   └── Font Awesome
└── Analytics:
    └── Google Analytics
```

**📋 SUBDOMÍNIOS TESTADOS (NÃO ATIVOS):**
```
SUBDOMÍNIOS INATIVOS:
├── desarrolloyempleo.test.cba.gov.ar
│   └── Status: Não responde (timeout/erro)
├── desarrolloyempleoi.cba.gov.ar
│   └── Status: Não responde (timeout/erro)
└── dwt8sjddftdpv.cloudfront.net
    └── Tipo: CNAME - CloudFront CDN (não testado diretamente)
```

#### Implicações de Segurança

**1. Superfície de Ataque Identificada:**
- **Host Ativo:** Apenas 1 de 4 subdomínios está ativo (25%)
- **WordPress Detectado:** WordPress 6.8.3 identificado - superfície de ataque conhecida
- **Plugins Identificados:** Elementor, Site Kit, Ivory Search - cada plugin pode ter vulnerabilidades

**2. Infraestrutura Cloud:**
- **AWS CloudFront:** CDN pode ocultar IPs de origem, mas também pode expor configurações
- **Amazon ALB:** Load balancer indica infraestrutura escalável
- **IPv6:** Endereço IPv6 identificado - pode ser usado para bypass de filtros IPv4

**3. Tecnologias com Potenciais Vulnerabilidades:**
- **WordPress 6.8.3:** Verificar CVEs conhecidos para esta versão
- **Elementor 3.30.4:** Plugin popular - verificar vulnerabilidades conhecidas
- **jQuery Migrate 3.4.1:** Versão antiga - pode ter vulnerabilidades
- **PHP:** Versão não identificada - necessário verificar versão específica

**4. Subdomínios Inativos:**
- **Ambiente de Teste:** `desarrolloyempleo.test.cba.gov.ar` não responde - pode estar offline ou protegido
- **Typo Domain:** `desarrolloyempleoi.cba.gov.ar` não responde - pode ser usado para phishing se ativado

**5. Informações Expostas:**
- **Título da Página:** Identifica claramente o propósito do site
- **Tecnologias:** Stack tecnológica completa exposta - facilita ataques direcionados
- **Plugins:** Lista de plugins WordPress exposta - permite busca por exploits específicos

#### Próximas Ações Recomendadas
1. ✅ **Executar comandos de probing** - CONCLUÍDO
2. ✅ **Analisar resultados e identificar tecnologias** - CONCLUÍDO (19 tecnologias identificadas)
3. ✅ **Priorizar alvos** - CONCLUÍDO (1 host ativo identificado)
4. ⬅️ **Prosseguir para Etapa 5 (Directory Brute-Forcing)** no host ativo
5. ⬅️ **Verificar versão específica do PHP** (importante para identificar vulnerabilidades)
6. ⬅️ **Pesquisar CVEs para WordPress 6.8.3 e plugins identificados**
7. ⬅️ **Testar subdomínios inativos periodicamente** (podem ser ativados)

---

### Fase 2: Reconhecimento Ativo - Etapa 5: Directory Brute-Forcing

#### Metodologia
Seguindo o Guia de Comandos de Ethical Hacking, o directory brute-forcing (também conhecido como content discovery) foi realizado usando uma wordlist para descobrir diretórios e arquivos ocultos no servidor web. Esta técnica é essencial para encontrar páginas de login, painéis administrativos, arquivos de configuração e backups que não estão vinculados no site.

#### Ferramentas Utilizadas
- **feroxbuster v2.8.0:** Ferramenta rápida e recursiva para directory brute-forcing
- **Wordlist:** `C:\Sec\Tools\SecLists\Discovery\Web-Content\common.txt` (4.750 entradas)
- **Target:** https://desarrolloyempleo.cba.gov.ar (host ativo identificado na Etapa 4)

#### Comandos Executados
```bash
# Step 1: Directory brute-forcing com feroxbuster
# Usando wordlist common.txt do SecLists
feroxbuster -u https://desarrolloyempleo.cba.gov.ar \
  -w C:\Sec\Tools\SecLists\Discovery\Web-Content\common.txt \
  -x php,html,txt,json,xml,js,css \
  -t 50 \
  -d 3 \
  -o reports/dirsearch_results.txt \
  --json

# Step 2: Análise de resultados (filtrar por status code)
# Hosts com status 200 (páginas funcionais)
findstr /C:"200" reports/dirsearch_results.txt > reports/dirs_200.txt

# Hosts com status 403 (páginas proibidas - interessantes)
findstr /C:"403" reports/dirsearch_results.txt > reports/dirs_403.txt

# Hosts com status 301/302 (redirecionamentos)
findstr /C:"301" reports/dirsearch_results.txt > reports/dirs_redirects.txt
findstr /C:"302" reports/dirsearch_results.txt >> reports/dirs_redirects.txt
```

**Parâmetros do feroxbuster:**
- `-u`: URL alvo
- `-w`: Wordlist a ser usada
- `-x`: Extensões de arquivo para testar (php, html, txt, json, xml, js, css)
- `-t`: Threads (50 threads para velocidade balanceada)
- `-d`: Profundidade de recursão (3 níveis)
- `-o`: Arquivo de saída
- `--json`: Saída em formato JSON para análise posterior

#### Resultados Detalhados

**📊 RESUMO DO DIRECTORY BRUTE-FORCING:**
```
feroxbuster Execução:
├── Alvo: https://desarrolloyempleo.cba.gov.ar
├── Wordlist: common.txt (4.750 entradas)
├── Extensões Testadas: php, html, txt, json, xml, js, css
├── Threads: 50
├── Profundidade: 3 níveis
└── Arquivo Gerado: dirsearch_results.txt
```

**🎯 DESCOBERTAS:**
```
RESULTADOS DO DIRECTORY BRUTE-FORCING:
├── Total de Requisições: 10.690 requisições
├── Status 200 (OK): 1 resultado
│   └── https://desarrolloyempleo.cba.gov.ar/ (página principal)
├── Status 301 (Redirecionamento Permanente): 8 resultados
│   ├── /.perf → /empresa/perfucor-srl/
│   ├── /.perf → /empresa/webw-jorge-guillermo/
│   └── Outros redirecionamentos WordPress
├── Status 403 (Forbidden): 10.533 resultados
│   ├── Arquivos de Configuração Sensíveis:
│   │   ├── /.config
│   │   ├── /.env
│   │   ├── /.htaccess (e variações)
│   │   ├── /.htpasswd (e variações)
│   │   └── /.hta (e variações)
│   └── Observação: 403 indica que o servidor reconhece o arquivo mas nega acesso
├── Status 404 (Not Found): 52 resultados
│   └── Arquivos/diretórios não existentes
└── Status 502 (Bad Gateway): 96 resultados
    └── Erros temporários do servidor durante a varredura
```

**📋 ANÁLISE DETALHADA:**

**1. Arquivos com Status 403 (Forbidden) - Interessantes:**
```
ARQUIVOS PROTEGIDOS IDENTIFICADOS:
├── Arquivos de Configuração Apache:
│   ├── /.htaccess (e variações: .htaccess.php, .htaccess.html, .htaccess.txt, etc.)
│   ├── /.htpasswd (e variações)
│   └── /.hta (e variações)
├── Arquivos de Ambiente:
│   ├── /.env (arquivo de variáveis de ambiente)
│   └── /.config (arquivo de configuração)
└── Observação: Status 403 indica que o servidor reconhece esses arquivos
    mas está bloqueando o acesso. Isso pode indicar:
    - Arquivos existem mas estão protegidos
    - Proteção via .htaccess ou WAF
    - Possível bypass com técnicas específicas
```

**2. Redirecionamentos WordPress (Status 301):**
```
REDIRECIONAMENTOS IDENTIFICADOS:
├── /.perf → /empresa/perfucor-srl/
│   └── Redirecionamento WordPress para página de empresa
└── Outros redirecionamentos para páginas de empresas
    └── Indica uso de permalinks WordPress customizados
```

**3. Estrutura WordPress Detectada:**
```
ESTRUTURA WORDPRESS IDENTIFICADA:
├── Redirecionamentos WordPress (/.perf → /empresa/*)
├── Proteção de arquivos sensíveis (.htaccess, .env)
└── Respostas 404 padrão do WordPress (páginas de erro personalizadas)
```

#### Principais Descobertas

**1. Proteção de Arquivos Sensíveis:**
- **10.533 arquivos retornaram 403:** O servidor está protegendo ativamente arquivos sensíveis
- **Arquivos .htaccess protegidos:** Indica configuração de segurança Apache
- **Arquivo .env protegido:** Boa prática - arquivo de variáveis de ambiente não está exposto
- **Arquivo .config protegido:** Arquivo de configuração não está acessível publicamente

**2. Redirecionamentos WordPress:**
- **8 redirecionamentos identificados:** WordPress está usando permalinks customizados
- **Páginas de empresas:** Redirecionamentos para `/empresa/*` indicam estrutura de conteúdo
- **Permalinks customizados:** Pode indicar configuração avançada do WordPress

**3. Superfície de Ataque:**
- **Apenas 1 resultado 200:** Apenas a página principal está acessível diretamente
- **Proteção ativa:** O servidor está bloqueando acesso a arquivos sensíveis
- **Estrutura oculta:** Muitos diretórios/arquivos podem existir mas não estão acessíveis

**4. Possíveis Pontos de Entrada:**
- **Arquivos 403 podem ser bypassados:** Técnicas como encoding, métodos HTTP alternativos, ou bypass de WAF
- **Redirecionamentos podem revelar estrutura:** URLs redirecionadas podem indicar estrutura de conteúdo
- **WordPress pode ter endpoints ocultos:** wp-admin, wp-login.php, wp-json podem estar acessíveis

#### Implicações de Segurança
- **Descoberta de Conteúdo Oculto:** Pode revelar diretórios e arquivos não vinculados publicamente
- **Painéis Administrativos:** Pode encontrar interfaces de administração não documentadas
- **Arquivos Sensíveis:** Pode descobrir backups, arquivos de configuração ou logs expostos
- **Estrutura da Aplicação:** Mapeia a estrutura de diretórios da aplicação WordPress
- **Endpoints de API:** Pode encontrar endpoints de API não documentados

#### Próximas Ações Recomendadas
1. ✅ **Executar comandos de directory brute-forcing** - CONCLUÍDO (10.690 requisições)
2. ✅ **Analisar resultados** - CONCLUÍDO (1 resultado 200, 8 redirecionamentos, 10.533 arquivos 403)
3. ⬅️ **Testar bypass de proteções 403** (encoding, métodos HTTP alternativos, bypass de WAF)
4. ⬅️ **Verificar endpoints WordPress padrão** (wp-admin, wp-login.php, wp-json, xmlrpc.php)
5. ⬅️ **Investigar redirecionamentos** (páginas de empresas podem ter informações úteis)
6. ✅ **Prosseguir para Etapa 6 (Combinar & Desduplicar URLs)** - CONCLUÍDO

---

### Fase 2: Reconhecimento Ativo - Etapa 6: Combinar & Desduplicar URLs

#### Metodologia
Seguindo o Guia de Comandos de Ethical Hacking, a combinação e desduplicação de URLs foi realizada para consolidar todos os resultados coletados das diferentes ferramentas de reconhecimento em um único arquivo mestre sem duplicatas. Esta é uma técnica fundamental de gerenciamento de dados que permite trabalhar com uma lista limpa e consolidada de todos os endpoints descobertos.

#### Ferramentas Utilizadas
- **Comandos Unix/Bash:** `cat`, `grep`, `sort -u`
- **Ferramentas de Extração:** `grep` com regex para extrair URLs de arquivos JSON
- **Fontes de Dados:**
  - URLs históricas do Wayback Machine (Etapa 2)
  - Hosts ativos identificados (Etapa 4)
  - URLs descobertas via directory brute-forcing (Etapa 5)

#### Comandos Executados
```bash
# Step 1: Extrair URLs do arquivo JSON do feroxbuster
cat dirsearch_results.txt | grep -o '"url":"[^"]*"' | sed 's/"url":"//g' | sed 's/"$//g' > dirsearch_urls.txt

# Step 2: Combinar todos os arquivos de URLs e desduplicar
cat wayback_urls.txt live_hosts.txt dirsearch_urls.txt | \
  grep -v "^#" | \
  grep -v "^$" | \
  sort -u > all_urls.txt

# Step 3: Contar URLs únicas
wc -l all_urls.txt
```

**Explicação dos Comandos:**
- `grep -o '"url":"[^"]*"'`: Extrai apenas o campo "url" do JSON
- `sed 's/"url":"//g'`: Remove o prefixo `"url":"`
- `sed 's/"$//g'`: Remove as aspas finais
- `grep -v "^#"`: Remove linhas de comentário
- `grep -v "^$"`: Remove linhas vazias
- `sort -u`: Ordena e remove duplicatas

#### Resultados Detalhados

**📊 RESUMO DA COMBINAÇÃO E DESDUPLICAÇÃO:**
```
Etapa 6 Execução:
├── Fontes Combinadas:
│   ├── wayback_urls.txt: 2.651 URLs históricas
│   ├── live_hosts.txt: 5 hosts ativos
│   └── dirsearch_urls.txt: 10.690 URLs do directory brute-forcing
├── Processamento:
│   ├── URLs extraídas do JSON: 10.690
│   ├── Linhas de comentário removidas: Sim
│   ├── Linhas vazias removidas: Sim
│   └── Duplicatas removidas: Sim
└── Resultado Final: 13.302 URLs únicas
```

**🎯 ESTATÍSTICAS DE CONSOLIDAÇÃO:**
```
COMBINAÇÃO DE FONTES:
├── Total de URLs antes da desduplicação: ~13.346 URLs
├── URLs únicas após desduplicação: 13.302 URLs
├── Duplicatas removidas: ~44 URLs
└── Taxa de desduplicação: 0.33% de duplicatas encontradas
```

**📁 ARQUIVOS GERADOS:**
- `dirsearch_urls.txt`: URLs extraídas do JSON do feroxbuster
- `all_urls.txt`: **Arquivo mestre consolidado** com 13.302 URLs únicas

#### Distribuição de URLs por Fonte

**1. URLs Históricas (Wayback Machine):**
- **Fonte:** `wayback_urls.txt`
- **Quantidade:** 2.651 URLs
- **Tipo:** URLs históricas do domínio que podem ainda estar ativas
- **Exemplos:**
  - Páginas de conteúdo WordPress
  - Arquivos PDF históricos
  - Endpoints de API antigos
  - Arquivos de configuração expostos

**2. Hosts Ativos:**
- **Fonte:** `live_hosts.txt`
- **Quantidade:** 5 URLs (HTTP e HTTPS)
- **Tipo:** Hosts confirmados como ativos
- **Exemplos:**
  - `http://desarrolloyempleo.cba.gov.ar`
  - `https://desarrolloyempleo.cba.gov.ar`

**3. URLs de Directory Brute-Forcing:**
- **Fonte:** `dirsearch_results.txt` (extraídas)
- **Quantidade:** 10.690 URLs
- **Tipo:** Diretórios e arquivos descobertos via brute-force
- **Exemplos:**
  - Arquivos de configuração (`.htaccess`, `.env`, `.config`)
  - Diretórios WordPress (`wp-admin`, `wp-content`)
  - Arquivos de backup
  - Endpoints de API

#### Implicações de Segurança

**1. Superfície de Ataque Consolidada:**
- **13.302 URLs únicas** representam a superfície de ataque completa identificada
- Lista consolidada facilita análise sistemática de vulnerabilidades
- Permite priorização de endpoints para testes de segurança

**2. Descobertas Consolidadas:**
- **URLs Históricas:** Podem revelar endpoints esquecidos ou mal configurados
- **Hosts Ativos:** Confirma quais serviços estão realmente online
- **Directory Brute-Forcing:** Expõe estrutura oculta da aplicação

**3. Próximos Passos Facilitados:**
- Lista consolidada pode ser usada para:
  - Crawling automatizado (Etapa 8)
  - Análise de JavaScript (Etapa 9)
  - Descoberta de parâmetros (Etapa 11)
  - Testes de vulnerabilidades (Etapas 16-19)

#### Próximas Ações Recomendadas
1. ✅ **Combinar URLs de todas as fontes** - CONCLUÍDO (13.302 URLs únicas)
2. ✅ **Desduplicar resultados** - CONCLUÍDO
3. ✅ **Gerar arquivo mestre consolidado** - CONCLUÍDO (`all_urls.txt`)
4. ⬅️ **Prosseguir para Etapa 7 (Reconhecimento Visual)** usando hosts ativos
5. ⬅️ **Usar `all_urls.txt` para crawling automatizado** (Etapa 8)
6. ⬅️ **Filtrar URLs JavaScript de `all_urls.txt`** para análise de segredos (Etapa 9)
7. ⬅️ **Extrair parâmetros de URLs** para testes de fuzzing (Etapa 11)

---

## Próximos Passos

### Ações Pendentes

#### Fases Concluídas
- [x] **1. DESCOBERTA DE SUBDOMÍNIOS** ✅ **CONCLUÍDA** (4 subdomínios descobertos)
- [x] **2. BUSCAR URLs HISTÓRICAS** ✅ **CONCLUÍDA** (2.651 URLs históricas encontradas)
- [x] **3. DORKING EM MECANISMOS DE BUSCA** ✅ **CONCLUÍDA** (1 descoberta importante: Endpoint AWS Cognito)
- [x] **4. PROBING & FINGERPRINTING** ✅ **CONCLUÍDA** (1 host ativo identificado, 19 tecnologias detectadas)
- [x] **5. BRUTE-FORCE DE DIRETÓRIOS** ✅ **CONCLUÍDA** (10.690 requisições, 1 resultado 200, 8 redirecionamentos, 10.533 arquivos 403)
- [x] **6. COMBINAR & DESDUPLICAR URLs** ✅ **CONCLUÍDA** (13.302 URLs únicas consolidadas)
- [x] **7. RECONHECIMENTO VISUAL** ✅ **CONCLUÍDA** (76 screenshots capturados: 2 do site principal, 74 de URLs do dirsearch)
- [x] **8. CRAWLING PARA ENDPOINTS** ✅ **CONCLUÍDA** (3.384 endpoints descobertos via katana)

#### Próximas Fases

#### Fases Planejadas
- [ ] **9. BUSCAR SEGREDOS EM ARQUIVOS JAVASCRIPT**
- [ ] **10. SCANNING DE REDE & SERVIÇOS**
- [ ] **11. DESCOBERTA DE ENDPOINTS & PARÂMETROS**
- [ ] **12. DETECÇÃO & SCANNING DE CMS**
- [ ] **13. TESTE DE BRUTE-FORCE DE AUTENTICAÇÃO** ⚠️ **INFO DISPONÍVEL** (ver seção abaixo)
- [ ] **14. BRUTE-FORCE & FUZZING DE VALORES DE PARÂMETROS**
- [ ] **15. TESTE DE BRUTE-FORCE BASEADO EM FORMULÁRIOS** ⚠️ **INFO DISPONÍVEL** (ver seção abaixo)
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

### Fase 2: Reconhecimento Ativo - Etapa 7: Reconhecimento Visual

#### Metodologia
Seguindo o Guia de Comandos de Ethical Hacking, o reconhecimento visual foi realizado usando EyeWitness para capturar screenshots de páginas web descobertas durante o reconhecimento. Esta técnica permite identificar rapidamente páginas interessantes (páginas de login, painéis administrativos, aplicações desatualizadas) sem precisar acessar manualmente cada URL.

#### Ferramentas Utilizadas
- **EyeWitness (Python):** Ferramenta para captura de screenshots de websites, RDP e VNC
- **Targets:**
  - Hosts ativos identificados (Etapa 4): `live_hosts_unique.txt`
  - URLs descobertas via directory brute-forcing (Etapa 5): `dirsearch_urls.txt`

#### Comandos Executados
```bash
# Step 1: Reconhecimento visual do site principal
cd reports
python C:\Sec\Tools\EyeWitness\Python\EyeWitness.py \
  --web \
  -f live_hosts_unique.txt \
  -d eyewitness_report \
  --no-prompt \
  --threads 4 \
  --timeout 10

# Step 2: Reconhecimento visual das URLs do dirsearch
python C:\Sec\Tools\EyeWitness\Python\EyeWitness.py \
  --web \
  -f dirsearch_urls.txt \
  -d eyewitness_dirsearch_report2 \
  --no-prompt \
  --threads 4 \
  --timeout 10
```

**Parâmetros do EyeWitness:**
- `--web`: Modo de captura de screenshots web
- `-f`: Arquivo de entrada com lista de URLs
- `-d`: Diretório de saída para o relatório
- `--no-prompt`: Execução não-interativa
- `--threads`: Número de threads paralelas (4 threads)
- `--timeout`: Timeout por requisição (10 segundos)

#### Resultados Detalhados

**📊 RESUMO DO RECONHECIMENTO VISUAL:**
```
EyeWitness Execução - Site Principal:
├── Alvo: live_hosts_unique.txt (2 URLs: http e https)
├── URLs Processadas: 2 URLs
├── Screenshots Capturados: 1 screenshot
├── Status: 2 URLs processadas com sucesso
└── Relatório Gerado: eyewitness_report/ (07/01/2026 19:50:49)

EyeWitness Execução - Directory Brute-Forcing:
├── Alvo: dirsearch_urls.txt (10.690 URLs)
├── URLs Processadas: 74 URLs com sucesso
├── Screenshots Capturados: 74 screenshots
│   ├── Uncategorized: 26 screenshots
│   └── 401/403 Unauthorized: 48 screenshots
├── Erros: 0 erros
└── Relatório Gerado: eyewitness_dirsearch_report2/ (07/01/2026 19:55:12)
```

**🎯 DESCOBERTAS DO SITE PRINCIPAL:**
```
SITE PRINCIPAL ANALISADO:
├── https://desarrolloyempleo.cba.gov.ar
│   ├── IP Resolvido: 18.155.21.14
│   ├── Título: "Ministerio de Desarrollo Social y Promoción del Empleo – Sitio Oficial del Ministerio de Desarrollo Social y Promoción del Empleo"
│   ├── Servidor: CloudFront (CDN AWS)
│   ├── Content-Type: text/html
│   ├── Content-Length: 919 bytes
│   ├── CloudFront POP: GRU3-P10 (São Paulo, Brasil)
│   └── Screenshot: Disponível em eyewitness_report/screens/
└── http://desarrolloyempleo.cba.gov.ar
    └── Redirecionado para HTTPS (não capturado separadamente)
```

**🔍 ANÁLISE DAS URLs DO DIRSEARCH:**
```
RESULTADOS DO RECONHECIMENTO VISUAL:
├── Total de Screenshots: 74 screenshots capturados
├── Categorização:
│   ├── Uncategorized (Status 200/Outros): 26 screenshots
│   │   └── Páginas funcionais e acessíveis
│   └── 401/403 Unauthorized: 48 screenshots
│       └── Páginas protegidas ou bloqueadas
└── Taxa de Sucesso: 74 de 10.690 URLs testadas (0.69%)
```

**📋 INFORMAÇÕES TÉCNICAS IDENTIFICADAS:**
```
HEADERS E METADADOS CAPTURADOS:
├── CloudFront CDN:
│   ├── X-Cache: Error from cloudfront (indica possível problema de cache)
│   ├── Via: CloudFront edge server
│   └── X-Amz-Cf-Pop: GRU3-P10 (São Paulo, Brasil)
├── Infraestrutura:
│   ├── CDN: AWS CloudFront
│   ├── IP: 18.155.21.14 (IPv4)
│   └── Content-Length: 919 bytes (página pequena)
└── Data de Captura: 07 de Janeiro de 2026, 19:50:49 (site principal)
```

#### Principais Descobertas

**1. Site Principal Confirmado:**
- **Screenshot capturado com sucesso:** Página principal está acessível e renderizando corretamente
- **CloudFront CDN:** Confirmado uso de AWS CloudFront para distribuição de conteúdo
- **IP de Origem:** 18.155.21.14 identificado (pode ser usado para testes diretos)
- **Página Pequena:** Content-Length de 919 bytes indica página simples ou redirecionamento

**2. URLs do Directory Brute-Forcing:**
- **74 URLs renderizadas:** Apenas 0.69% das URLs testadas retornaram conteúdo renderizável
- **26 páginas acessíveis:** Páginas com status 200 ou outros códigos de sucesso
- **48 páginas protegidas:** Páginas com status 401/403 que podem conter conteúdo interessante
- **Taxa de sucesso baixa:** Indica que a maioria das URLs não retorna conteúdo HTML renderizável

**3. CloudFront Cache Error:**
- **X-Cache: Error from cloudfront:** Indica possível problema de cache ou configuração
- **Pode indicar:** Problemas de configuração do CDN ou conteúdo não cacheável
- **Implicação:** Pode ser usado para identificar comportamento anômalo do CDN

**4. Localização do CDN:**
- **CloudFront POP: GRU3-P10:** São Paulo, Brasil
- **Indica:** Servidor edge mais próximo ao Brasil
- **Implicação:** Latência baixa para usuários brasileiros

#### Implicações de Segurança

**1. Superfície de Ataque Visual:**
- **76 screenshots capturados:** Permitem análise visual rápida de páginas interessantes
- **Identificação de páginas de login:** Screenshots podem revelar páginas de autenticação não documentadas
- **Aplicações desatualizadas:** Visual pode identificar interfaces antigas ou vulneráveis

**2. Páginas Protegidas (401/403):**
- **48 páginas com proteção:** Podem conter conteúdo sensível ou funcionalidades administrativas
- **Análise visual:** Screenshots podem revelar tipo de proteção (formulário de login, página de erro, etc.)
- **Possível bypass:** Páginas protegidas podem ser vulneráveis a bypass de autenticação

**3. Informações de Infraestrutura:**
- **IP de origem identificado:** 18.155.21.14 pode ser usado para testes diretos (bypass de CDN)
- **CloudFront configurado:** CDN pode ocultar IPs de origem, mas também pode expor configurações
- **Cache error:** Pode indicar problemas de configuração ou comportamento anômalo

**4. Eficiência do Directory Brute-Forcing:**
- **Taxa de sucesso baixa (0.69%):** Indica que a maioria das URLs não retorna conteúdo útil
- **Foco em URLs válidas:** As 74 URLs capturadas são prioridade para análise detalhada
- **Otimização:** Pode ser necessário ajustar wordlist ou técnicas de descoberta

#### Próximas Ações Recomendadas
1. ✅ **Executar reconhecimento visual do site principal** - CONCLUÍDO (2 URLs, 1 screenshot)
2. ✅ **Executar reconhecimento visual das URLs do dirsearch** - CONCLUÍDO (74 screenshots)
3. ⬅️ **Analisar screenshots manualmente** para identificar páginas interessantes (login, admin, etc.)
4. ⬅️ **Priorizar URLs com screenshots** para análise detalhada (Etapa 8 - Crawling)
5. ⬅️ **Investigar páginas 401/403** para possíveis bypass de autenticação
6. ⬅️ **Testar acesso direto ao IP** (18.155.21.14 para bypass de CDN)
7. ⬅️ **Prosseguir para Etapa 8 (Crawling para Endpoints)** usando lista consolidada de URLs

---

### Fase 2: Reconhecimento Ativo - Etapa 8: Crawling para Endpoints

#### Metodologia
Seguindo o Guia de Comandos de Ethical Hacking, o crawling automatizado foi realizado usando Katana para descobrir todos os links, caminhos e arquivos JavaScript vinculados no site. Esta técnica automatiza o processo de mapeamento de websites e pode descobrir páginas administrativas esquecidas, versões antigas de APIs ou endpoints de teste que ainda estão ativos mas não estão vinculados.

#### Ferramentas Utilizadas
- **Katana v1.4.0:** Ferramenta de crawling e spidering de próxima geração do ProjectDiscovery
- **Target:** Hosts ativos identificados (Etapa 4): `live_hosts_unique.txt`

#### Comandos Executados
```bash
# Step 1: Instalar Katana para Windows
cd C:\Sec\Tools
curl -L -o katana_windows_amd64.zip https://github.com/projectdiscovery/katana/releases/download/v1.4.0/katana_1.4.0_windows_amd64.zip
unzip katana_windows_amd64.zip

# Step 2: Executar crawling nos hosts ativos
cd reports
C:\Sec\Tools\katana.exe -list live_hosts_unique.txt -depth 3 -o crawled_endpoints.txt -silent
```

**Parâmetros do Katana:**
- `-list`: Arquivo de entrada com lista de URLs
- `-depth`: Profundidade de recursão (3 níveis)
- `-o`: Arquivo de saída
- `-silent`: Modo silencioso (sem output verboso)

#### Resultados Detalhados

**📊 RESUMO DO CRAWLING:**
```
Katana Execução:
├── Alvo: live_hosts_unique.txt (2 URLs: http e https)
├── Profundidade: 3 níveis de recursão
├── Endpoints Descobertos: 3.384 endpoints únicos
├── Ferramenta: Katana v1.4.0 (ProjectDiscovery)
└── Arquivo Gerado: crawled_endpoints.txt
```

**🎯 CATEGORIAS DE ENDPOINTS DESCOBERTOS:**
```
TIPOS DE ENDPOINTS IDENTIFICADOS:
├── Recursos Estáticos:
│   ├── CSS: Elementor, plugins, temas
│   ├── JavaScript: jQuery, React, plugins
│   └── Imagens: Uploads, assets
├── WordPress REST API:
│   ├── /wp-json/ (API principal)
│   ├── /wp-json/oembed/1.0/embed (oEmbed endpoints)
│   └── /wp-json/wp/v2/posts/{id} (Posts API)
│   └── /wp-json/wp/v2/pages/{id} (Pages API)
├── Endpoints WordPress:
│   ├── /xmlrpc.php?rsd (XMLRPC - 16 sites)
│   ├── /feed/ (RSS feeds)
│   └── /comments/feed/ (Comments RSS)
└── Páginas de Conteúdo:
    ├── Posts e páginas WordPress
    ├── Seções do site
    └── Links externos para outros sites cba.gov.ar
```

**🔍 DESCOBERTAS IMPORTANTES:**

**1. XMLRPC Exposto em Múltiplos Sites:**
```
SITES COM XMLRPC ACESSÍVEL:
├── desarrolloyempleo.cba.gov.ar
├── www.cba.gov.ar
├── estadistica.cba.gov.ar
├── cordobadigital.cba.gov.ar
├── registrocivil.cba.gov.ar
├── prensa.cba.gov.ar
├── ambiente.cba.gov.ar
├── puentesdigitales.cba.gov.ar
├── estandardigital.cba.gov.ar
├── hacemosescuela.cba.gov.ar
├── cultura.cba.gov.ar
├── deportes.cba.gov.ar
├── ceprocor.cba.gov.ar
├── consejodelamagistratura.cba.gov.ar
├── compraspublicas.cba.gov.ar
└── gestionabierta.cba.gov.ar
Total: 16 sites WordPress com XMLRPC acessível
```

**2. WordPress REST API Exposta:**
```
ENDPOINTS REST API IDENTIFICADOS:
├── /wp-json/ (API raiz)
├── /wp-json/oembed/1.0/embed (múltiplas URLs)
├── /wp-json/wp/v2/posts/{id} (posts específicos)
└── /wp-json/wp/v2/pages/{id} (páginas específicas)
```

**3. Superfície de Ataque Expandida:**
```
ESTATÍSTICAS:
├── Total de Endpoints: 3.384 URLs únicas
├── Sites Relacionados: Múltiplos subdomínios cba.gov.ar
├── Recursos Estáticos: ~60% (CSS, JS, imagens)
├── Endpoints Dinâmicos: ~30% (APIs, páginas)
└── Links Externos: ~10% (outros sites governamentais)
```

#### Principais Descobertas

**1. Infraestrutura WordPress Interconectada:**
- **Múltiplos sites WordPress:** Crawling revelou interconexões entre sites governamentais
- **Compartilhamento de recursos:** Sites compartilham plugins e temas similares
- **Superfície de ataque expandida:** Vulnerabilidades em um site podem afetar outros

**2. Endpoints Sensíveis Identificados:**
- **XMLRPC:** 16 sites com XMLRPC acessível (vulnerabilidade DE-001)
- **REST API:** Múltiplos endpoints wp-json expostos (vulnerabilidade DE-002)
- **Feeds RSS:** Feeds de posts e comentários expostos

**3. Informações de Versão Expostas:**
- **Versões de plugins:** Elementor, jQuery, e outros plugins expõem versões
- **Versões WordPress:** Informações sobre versão do WordPress acessíveis
- **Facilita ataques direcionados:** Versões conhecidas permitem seleção de exploits

**4. Estrutura do Site Mapeada:**
- **3.384 endpoints únicos:** Mapeamento completo da estrutura
- **Profundidade de 3 níveis:** Crawling profundo revelou conteúdo oculto
- **Links externos:** Conexões com outros sites governamentais identificadas

#### Implicações de Segurança

**1. Superfície de Ataque Expandida:**
- **3.384 endpoints:** Cada endpoint é um potencial ponto de entrada
- **Múltiplos sites:** Vulnerabilidades podem se propagar entre sites
- **Endpoints ocultos:** Páginas não vinculadas podem ter menos proteções

**2. Informação de Reconhecimento:**
- **Estrutura mapeada:** Ataque pode planejar estratégia baseada na estrutura
- **Versões expostas:** Permite seleção de exploits específicos
- **APIs expostas:** REST API pode vazar informações sensíveis

**3. Vulnerabilidades Identificadas:**
- **XMLRPC exposto:** Permite brute-force amplificado (DE-001)
- **REST API exposta:** Pode vazar informações (DE-002)
- **Versões expostas:** Facilita ataques direcionados (DE-003)

#### Próximas Ações Recomendadas
1. ✅ **Executar crawling automatizado** - CONCLUÍDO (3.384 endpoints)
2. ✅ **Identificar endpoints sensíveis** - CONCLUÍDO (XMLRPC, REST API)
3. ⬅️ **Analisar endpoints JavaScript** para busca de segredos (Etapa 9)
4. ⬅️ **Testar endpoints REST API** para informações sensíveis
5. ⬅️ **Validar proteções XMLRPC** nos 16 sites identificados
6. ⬅️ **Prosseguir para Etapa 9 (Buscar Segredos em Arquivos JavaScript)** usando endpoints descobertos

---

## Informações para Testes de Autenticação (Etapas 13 e 15)

**Nota:** Esta seção contém informações coletadas durante o reconhecimento passivo (Etapa 3 - Dorking) que serão utilizadas nas etapas de teste de autenticação (Etapas 13 e 15).

### Endpoints de Autenticação Identificados

**Fonte:** Descobertas da Etapa 3 (Dorking) - Documentação completa em `dorking-discoveries.md`

#### 1. Endpoint Principal de Autenticação AWS Cognito

**URL de Login:**
```
https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/login
```

**Parâmetros OAuth2 Identificados:**
```
client_id=515ap1iticksk0ci68kr822dfm
redirect_uri=https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse
response_type=code
scope=openid
prompt=login
display=page
state=[Base64 encoded - possivelmente CSRF token]
```

**Informações Técnicas:**
- **Domínio Cognito:** `mj-cba-gov-ar.auth.us-east-2.amazoncognito.com`
- **Região AWS:** `us-east-2` (Ohio, USA)
- **Protocolo:** OAuth2/OpenID Connect
- **Client ID:** `515ap1iticksk0ci68kr822dfm`
- **Callback Endpoint:** `https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse`

#### 2. Fluxo OAuth2 Mapeado

```
1. Usuário acessa desarrolloyempleo.cba.gov.ar
2. Redirecionado para AWS Cognito (mj-cba-gov-ar.auth.us-east-2.amazoncognito.com)
3. Autenticação no Cognito
4. Callback para: desarrolloyempleo.cba.gov.ar/oauth2/idpresponse
5. Aplicação recebe authorization code
6. Troca code por tokens (access token, ID token)
```

#### 3. Pontos de Teste para Authentication Bypass

**Para Etapa 13 - Teste de Brute-Force de Autenticação:**
- **Endpoint de Login:** `https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/login`
- **Método:** POST (formulário de autenticação)
- **Campos Identificados:** Username, Password
- **Funcionalidade Adicional:** "Forgot your password?" (testar password reset abuse)

**Para Etapa 15 - Teste de Brute-Force Baseado em Formulários:**
- **Formulário de Login:** AWS Cognito login form
- **Parâmetros OAuth2:** client_id, redirect_uri, state (verificar manipulação)
- **CSRF Protection:** State parameter (Base64 encoded)
- **Callback Endpoint:** `/oauth2/idpresponse` (verificar validação)

#### 4. Vetores de Ataque Identificados

**Brute-Force de Autenticação:**
- Testar credenciais fracas/comuns
- Verificar rate limiting e bloqueios
- Testar account enumeration (mensagens de erro diferentes)

**OAuth2 Misconfiguration:**
- Verificar se `redirect_uri` pode ser manipulado (Open Redirect)
- Testar manipulação do parâmetro `state` (CSRF bypass)
- Verificar validação do `client_id`

**Password Reset Abuse:**
- Testar funcionalidade "Forgot your password?"
- Verificar se permite enumerar usuários
- Testar token de reset previsível ou reutilizável

**Account Enumeration:**
- Verificar mensagens de erro diferentes para usuários válidos/inválidos
- Testar tempo de resposta diferente
- Verificar se email/username é válido antes de enviar reset

#### 5. Endpoints Adicionais para Teste

**Configuração OpenID Connect:**
```
https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/.well-known/openid-configuration
```
- Verificar configurações públicas do OAuth2
- Identificar endpoints adicionais (token, userinfo, etc.)
- Verificar scopes disponíveis

**Callback Endpoint:**
```
https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse
```
- Verificar se endpoint está protegido
- Testar acesso direto (pode vazar informações)
- Verificar validação de parâmetros

#### 6. Comandos de Teste Recomendados

**Análise do Endpoint:**
```bash
# Verificar se endpoint está acessível
curl -I https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/login

# Verificar headers de segurança
curl -v https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/login 2>&1 | grep -i "x-"

# Obter configuração OpenID Connect
curl https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/.well-known/openid-configuration
```

**Teste do Callback:**
```bash
# Verificar endpoint de callback
curl -I https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse

# Testar acesso direto (deve retornar erro, mas pode vazar informações)
curl https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse
```

**Nota:** Para testes de brute-force e manipulação de parâmetros, usar ferramentas especializadas (Hydra, Burp Suite, etc.) conforme Etapas 13 e 15 do guia.

#### 7. Informações de Referência

- **Documentação Completa:** Ver `dorking-discoveries.md` para análise detalhada
- **Client ID:** `515ap1iticksk0ci68kr822dfm` (pode ser usado para identificar aplicação no Cognito)
- **State Parameter:** Base64 encoded - possivelmente contém CSRF token ou dados de sessão

---

## Contatos

Para questões sobre este relatório:
- **Email:** security-team@example.com
- **Próxima Data de Atualização:** Após conclusão da Etapa 3

---

**⚠️ Aviso Legal:** Este documento contém informações confidenciais e deve ser tratado de acordo com as políticas de segurança da organização.
