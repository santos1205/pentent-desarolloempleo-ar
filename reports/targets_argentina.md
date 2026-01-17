# Targets Argentina - Pentest

**Data de criação:** 2025-01-06  
**Status:** Pendente - Links coletados para futuros pentests

## ⚠️ AVISO IMPORTANTE
**NÃO realizar pentests sem autorização expressa dos proprietários dos sites.**

---

## Sites Governamentais Argentinos

### 1. Polo Científico Tecnológico - Trenque Lauquen
- **URL:** https://pct.trenquelauquen.gov.ar/
- **Tipo:** Site governamental municipal
- **Descrição:** Polo Científico Tecnológico da Municipalidade de Trenque Lauquen
- **Domínio:** .gov.ar
- **Contato:** pct@trenquelauquen.gov.ar | (2392) 531228
- **Observações:** 
  - Site institucional com informações sobre cursos, talleres, emprendedores
  - Possui formulário de contato
  - Links para Facebook e Instagram

### 2. NIC Argentina
- **URL:** https://punto.gov.ar/es
- **Tipo:** Site governamental - Registro de dominios
- **Descrição:** NIC Argentina - Registro oficial de dominios .ar
- **Domínio:** .gov.ar
- **Observações:**
  - Sistema de registro de dominios
  - Buscador de dominios
  - Portal de serviços para registro de dominios .ar
  - Múltiplas zonas: .ar, .com.ar, .net.ar, .gob.ar, etc.

### 3. Prensa Córdoba
- **URL:** https://prensa.cba.gov.ar/
- **Tipo:** Site governamental provincial
- **Descrição:** Portal de notícias do governo de Córdoba
- **Domínio:** .gov.ar
- **Observações:**
  - Site de imprensa/governo
  - Provavelmente contém notícias e comunicados oficiais

### 4. Municipalidad de Necochea
- **URL:** https://necochea.gov.ar/
- **Tipo:** Site governamental municipal
- **Descrição:** Portal da Municipalidade de Necochea
- **Domínio:** .gov.ar
- **Contato:** informes@necochea.gov.ar | (02262) 44-8000
- **Observações:**
  - Site municipal completo
  - Serviços online (licenças, pagamentos, trâmites)
  - Portal de transparência
  - Múltiplas seções: Gobierno, Servicios, Transparencia, Información
  - Apps e mapas úteis

### 5. Ministerio de Desarrollo Social y Promoción del Empleo - Córdoba
- **URL:** https://desarrolloyempleo.cba.gov.ar/
- **Tipo:** Site governamental provincial
- **Descrição:** Ministério de Desenvolvimento Social e Promoção do Emprego de Córdoba
- **Domínio:** .gov.ar
- **Observações:**
  - Portal de programas sociais e de emprego
  - Seções: Programas, Novedades, Institucional, Contacto
  - PPP 2025 mencionado

---

## Sites Comerciais e Educacionais Argentinos

### 6. Carrefour Argentina
- **URL:** https://www.carrefour.com.ar/
- **Tipo:** E-commerce / Supermercado online
- **Descrição:** Site de e-commerce do Carrefour Argentina
- **Domínio:** .com.ar
- **Observações:**
  - E-commerce completo com carrinho de compras
  - Sistema de pagamento online
  - App móvel disponível
  - Promoções e ofertas online
  - Sistema de entrega e retirada
  - Área de login/usuário (Mi Carrefour)
  - Múltiplas categorias de produtos

### 7. Universidad Nacional de Lanús (UNLa)
- **URL:** https://www.unla.edu.ar/
- **Tipo:** Site educacional - Universidade pública
- **Descrição:** Portal da Universidade Nacional de Lanús
- **Domínio:** .edu.ar
- **Observações:**
  - Site institucional universitário completo
  - Sistema de autogestão (SIU Guaraní)
  - Portal de pesquisadores e projetos
  - Sistema de vinculação tecnológica
  - Múltiplas carreiras de grado e posgrado
  - Portal de publicações científicas
  - Sistema de webmail
  - Portal de transparência
  - Biblioteca e recursos acadêmicos
  - Radio UNLa e produções audiovisuais

### 8. Gador
- **URL:** https://www.gador.com.ar/en/
- **Tipo:** Site comercial - Empresa farmacêutica
- **Descrição:** Site da empresa farmacêutica Gador
- **Domínio:** .com.ar
- **Observações:**
  - Site corporativo farmacêutico
  - Versão em inglês disponível (/en/)
  - Informações sobre produtos farmacêuticos
  - Possível área de profissionais da saúde
  - Informações corporativas e institucionais

---

## Informações Técnicas

### Domínios Identificados
- `.gov.ar` - Sites governamentais argentinos (5 sites)
- `.com.ar` - Sites comerciais argentinos (2 sites: Carrefour, Gador)
- `.edu.ar` - Sites educacionais argentinos (1 site: UNLa)
- Subdomínios variados (pct, punto, prensa, desarrolloyempleo)

### Tecnologias Potenciais (a verificar)
- CMS governamentais comuns na Argentina
- Possíveis frameworks PHP, ASP.NET, ou customizados
- Sistemas de gestão de conteúdo

---

## Checklist para Pentest Futuro

### Reconhecimento Passivo
- [ ] Enumerar subdomínios
- [ ] Identificar tecnologias (Wappalyzer, WhatWeb)
- [ ] Buscar informações em Wayback Machine
- [ ] Verificar certificados SSL/TLS
- [ ] Buscar vazamentos de dados (Have I Been Pwned, etc.)

### Reconhecimento Ativo
- [ ] Scan de portas (nmap)
- [ ] Enumeração de diretórios
- [ ] Identificação de CMS/versões
- [ ] Busca por arquivos sensíveis (robots.txt, sitemap.xml, etc.)

### Análise de Vulnerabilidades
- [ ] Verificar versões desatualizadas
- [ ] Testar endpoints de API
- [ ] Verificar configurações inseguras
- [ ] Análise de headers de segurança
- [ ] Testes de autenticação/autorização

### Documentação
- [ ] Screenshots das páginas principais
- [ ] Mapeamento de funcionalidades
- [ ] Lista de endpoints descobertos
- [ ] Relatório de vulnerabilidades encontradas

---

## Notas Adicionais

- **Sites Governamentais (.gov.ar):** 5 sites - Requerem autorização formal antes de qualquer teste
- **E-commerce (Carrefour):** Sistema de pagamento online - Alto valor para testes de segurança
- **Universidade (UNLa):** Múltiplos sistemas (SIU Guaraní, webmail, portais) - Dados sensíveis de estudantes
- **Farmacêutica (Gador):** Informações corporativas e possíveis dados de profissionais da saúde
- Sites podem ter diferentes níveis de segurança
- Verificar políticas de bug bounty (se existirem)
- E-commerces geralmente têm maior superfície de ataque (APIs, pagamentos, autenticação)

---

## Referências

- [NIC Argentina](https://punto.gov.ar/es) - Informações sobre domínios .ar
- Documentação de pentest ética
- Guias de segurança web

---

**Última atualização:** 2025-01-06  
**Total de targets:** 8 sites

