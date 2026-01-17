# Etapa 18: Teste de Cross-Site Scripting (XSS)

## Ferramentas Utilizadas

1. **Dalfox v2.12.0** - Scanner automatizado de XSS
2. **XSStrike v3.1.5** - Scanner especializado com técnicas de bypass
3. **ffuf v2.1.0** - Fuzzing com payloads XSS
4. **ParamSpider** - Descobrir URLs com parâmetros

## Arquivos

- `xss_payloads_basic.txt` - Wordlist de payloads XSS básicos
- `endpoints_to_test.txt` - Endpoints identificados nas etapas anteriores
- `run_tests_windows.bat` - Script para executar todos os testes (Windows)
- `run_tests.sh` - Script para executar todos os testes (Linux/WSL)

## Parâmetros a Testar

Baseado nas descobertas das Etapas 11 e 14:

1. `context` - WordPress REST API (funcional)
2. `password` - WordPress REST API (funcional, vulnerável a brute-force)
3. `page_id` - Query string WordPress
4. `p` - Query string WordPress (abreviação)
5. `url` - oEmbed API (vetor SSRF também)
6. `id` - Parâmetro oculto
7. `_wpnonce` - Token CSRF
8. `_method` - Method override

## Contexto de Segurança

### Fatores que Facilitam XSS:
- ❌ **Missing CSP** (Content-Security-Policy) - Identificado na Etapa 16
- ❌ **Cookies sem httponly** - AWSALB e AWSALBCORS podem ser acessados via JavaScript
- ✅ **WordPress REST API exposta** - Múltiplos endpoints para testar

### Cadeia de Exploração Potencial:
1. XSS descoberto
2. Sem CSP, XSS executa sem restrições
3. Cookies sem httponly acessíveis via JavaScript
4. Atacante rouba cookies via XSS
5. Atacante usa cookies para sessão hijacking

## Execução

### Windows:
```cmd
cd reports\etapa18_xss
run_tests_windows.bat
```

### Linux/WSL:
```bash
cd reports/etapa18_xss
chmod +x run_tests.sh
./run_tests.sh
```

### Execução Manual:

#### 1. Dalfox (endpoint específico):
```bash
C:\Sec\Tools\dalfox.exe url "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test"
```

#### 2. XSStrike:
```bash
python C:\Sec\Tools\XSStrike\xsstrike.py -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=test" --crawl -l 2
```

#### 3. ffuf (fuzzing):
```bash
C:\Sec\Tools\ffuf\ffuf.exe -w xss_payloads_basic.txt -u "https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/posts/106992?context=FUZZ" -fc 404,403
```

#### 4. ParamSpider + Dalfox:
```bash
cd C:\Sec\Tools\ParamSpider
python -m paramspider.main -d desarrolloyempleo.cba.gov.ar -o ../../reports/etapa18_xss/paramspider_urls.txt
cat ../../reports/etapa18_xss/paramspider_urls.txt | C:\Sec\Tools\dalfox.exe pipe
```

## Resultados Esperados

Os resultados serão salvos em:
- `dalfox_*.json` e `dalfox_*.txt` - Resultados do Dalfox
- `xsstrike_results.json` e `xsstrike_results.txt` - Resultados do XSStrike
- `ffuf_xss_results.json` e `ffuf_xss_results.txt` - Resultados do ffuf
- `paramspider_xss_urls.txt` - URLs descobertas pelo ParamSpider
- `dalfox_pipe_results.json` e `dalfox_pipe_results.txt` - Resultados do Dalfox pipe
