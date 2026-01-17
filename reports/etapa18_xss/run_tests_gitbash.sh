#!/bin/bash
# Etapa 18: Teste de Cross-Site Scripting (XSS)
# Alvo: https://desarrolloyempleo.cba.gov.ar
# Compatível com Git Bash no Windows

echo "=========================================="
echo "ETAPA 18: TESTE DE CROSS-SITE SCRIPTING (XSS)"
echo "=========================================="
echo ""

# Diretório base
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLS_DIR="/c/Sec/Tools"
TARGET="https://desarrolloyempleo.cba.gov.ar"

cd "$BASE_DIR" || exit

echo "[+] Teste 1: Dalfox - Scanner Automatizado"
echo "--------------------------------------------"
# Teste com Dalfox nos endpoints identificados
while IFS= read -r url; do
    if [ -n "$url" ]; then
        echo "Testando: $url"
        # Extrair nome do arquivo da URL
        filename=$(echo "$url" | sed 's/[^a-zA-Z0-9]/_/g' | cut -c1-50)
        "$TOOLS_DIR/dalfox.exe" url "$url" --format json -o "dalfox_${filename}.json" > "dalfox_${filename}.txt" 2>&1
        sleep 2
    fi
done < endpoints_to_test.txt

echo ""
echo "[+] Teste 2: XSStrike - Scanner Especializado"
echo "--------------------------------------------"
python "$TOOLS_DIR/XSStrike/xsstrike.py" -u "$TARGET/wp-json/wp/v2/posts/106992?context=test" --crawl -l 2 -t 2 --json -o xsstrike_results.json > xsstrike_results.txt 2>&1

echo ""
echo "[+] Teste 3: ffuf - Fuzzing com Payloads XSS"
echo "--------------------------------------------"
"$TOOLS_DIR/ffuf/ffuf.exe" -w xss_payloads_basic.txt -u "$TARGET/wp-json/wp/v2/posts/106992?context=FUZZ" -fc 404,403 -t 2 -rate 3 -o ffuf_xss_results.json > ffuf_xss_results.txt 2>&1

echo ""
echo "[+] Teste 4: ParamSpider - Descobrir Novos Parâmetros"
echo "--------------------------------------------"
cd "$TOOLS_DIR/ParamSpider" || exit
python -m paramspider.main -d desarrolloyempleo.cba.gov.ar -o "$BASE_DIR/paramspider_xss_urls.txt" > "$BASE_DIR/paramspider_xss_output.txt" 2>&1

echo ""
echo "[+] Teste 5: Dalfox Pipe - Testar URLs do ParamSpider"
echo "--------------------------------------------"
if [ -f "$BASE_DIR/paramspider_xss_urls.txt" ]; then
    cat "$BASE_DIR/paramspider_xss_urls.txt" | "$TOOLS_DIR/dalfox.exe" pipe --format json -o "$BASE_DIR/dalfox_pipe_results.json" > "$BASE_DIR/dalfox_pipe_results.txt" 2>&1
fi

echo ""
echo "=========================================="
echo "TESTES CONCLUÍDOS"
echo "=========================================="
echo "Resultados salvos em: $BASE_DIR"
