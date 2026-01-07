# Descobertas do Dorking - Desarrollo y Empleo CBA

## Etapa 3: Search Engine Dorking & Reconnaissance

**Data:** 7 de Janeiro de 2026  
**Alvo:** `desarrolloyempleo.cba.gov.ar`  
**Status:** 🔄 Em Progresso

---

## Descobertas Importantes

### 1. Endpoint de Autenticação AWS Cognito

**URL Encontrada:**
```
https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/login?client_id=515ap1iticksk0ci68kr822dfm&redirect_uri=https%3A%2F%2Fdesarrolloyempleo.cba.gov.ar%2Foauth2%2Fidpresponse&response_type=code&scope=openid&state=HZ0k%2FZzBiAfD2Lu1LiETKWY2riBoU56UZj2ylvXJ7nj7fze%2BCEf%2FeBXE6FU%2BtPQbPq5zyreJ8HV%2BC475gkuMwB00u6rB1qQGKjI1FRnhQnO%2FLrajlUinG0JOxI7sXEa2GVmr0DhhW2vqXkZZmxqz1vLyrRy3TXIWZbXio%2BG%2BLNQbDgaIHGCX5o36i4%2BeLf1xmes8xKyjl5QBhtG0rFIeQoW8IEqilutRJbL2MHXs1iT7pS2GwZISj9ovKYgFYYYYrcNcNNoUqPOG28PLUpTYJme44u%2BaMs2iSPI1J5VDFEl6%2FXFCvcooOA%3D%3D&prompt=login&display=page
```

**Análise da URL:**

#### Componentes Identificados:
```
┌─────────────────────────────────────────────────────────────┐
│ INFORMAÇÕES EXTRAÍDAS DA URL                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ Domínio Cognito:                                            │
│ ├── mj-cba-gov-ar.auth.us-east-2.amazoncognito.com        │
│ └── Região AWS: us-east-2 (Ohio)                           │
│                                                             │
│ Client ID:                                                  │
│ ├── 515ap1iticksk0ci68kr822dfm                            │
│ └── Identificador único da aplicação no Cognito           │
│                                                             │
│ Redirect URI:                                               │
│ ├── https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse│
│ └── Endpoint de callback após autenticação                │
│                                                             │
│ Protocolo OAuth2:                                           │
│ ├── response_type: code                                    │
│ ├── scope: openid                                          │
│ ├── prompt: login                                          │
│ └── display: page                                          │
│                                                             │
│ State Parameter:                                            │
│ └── HZ0k/ZzBiAfD2Lu1LiETKWY2riBoU56UZj2ylvXJ7nj7fze+CEf/   │
│     eBXE6FU+tPQbPq5zyreJ8HV+C475gkuMwB00u6rB1qQGKjI1FRnhQnO/│
│     LrajlUinG0JOxI7sXEa2GVmr0DhhW2vqXkZZmxqz1vLyrRy3TXIWZbXio│
│     +G+LNQbDgaIHGCX5o36i4+eLf1xmes8xKyjl5QBhtG0rFIeQoW8IEqil│
│     utRJbL2MHXs1iT7pS2GwZISj9ovKYgFYYYYrcNcNNoUqPOG28PLUpTYJm│
│     e44u+aMs2iSPI1J5VDFEl6/XFCvcooOA==                     │
│     (Base64 encoded - possivelmente contém dados de sessão)│
└─────────────────────────────────────────────────────────────┘
```

#### Implicações de Segurança:

**1. Infraestrutura de Autenticação:**
- ✅ **AWS Cognito:** Sistema de autenticação gerenciado pela AWS
- ✅ **OAuth2/OpenID Connect:** Protocolo padrão de autenticação
- ⚠️ **Client ID Exposto:** Client ID visível na URL (normal, mas pode ser usado para reconhecimento)

**2. Pontos de Teste Identificados:**
- 🔍 **Endpoint de Login:** Página de autenticação principal
- 🔍 **Callback URI:** `/oauth2/idpresponse` - endpoint de retorno após autenticação
- 🔍 **State Parameter:** Pode conter informações de sessão ou CSRF token

**3. Superfície de Ataque Expandida:**
- **Novo Domínio:** `mj-cba-gov-ar.auth.us-east-2.amazoncognito.com`
- **Região AWS:** `us-east-2` (Ohio, USA)
- **Protocolo:** OAuth2/OpenID Connect

**4. Possíveis Vetores de Ataque:**
- 🔐 **Brute-Force de Autenticação:** Testar credenciais fracas
- 🔐 **OAuth2 Misconfiguration:** Verificar configurações incorretas do OAuth2
- 🔐 **State Parameter Manipulation:** Testar manipulação do parâmetro state
- 🔐 **Open Redirect:** Verificar se redirect_uri pode ser manipulado
- 🔐 **Account Enumeration:** Verificar se é possível enumerar usuários
- 🔐 **Password Reset Abuse:** Testar funcionalidade de "Forgot your password?"

---

## Análise Técnica Detalhada

### OAuth2 Flow Identificado:
```
1. Usuário acessa desarrolloyempleo.cba.gov.ar
2. Redirecionado para AWS Cognito (mj-cba-gov-ar.auth.us-east-2.amazoncognito.com)
3. Autenticação no Cognito
4. Callback para: desarrolloyempleo.cba.gov.ar/oauth2/idpresponse
5. Aplicação recebe authorization code
6. Troca code por tokens (access token, ID token)
```

### Informações Extraídas:

**Client ID:** `515ap1iticksk0ci68kr822dfm`
- Pode ser usado para:
  - Identificar a aplicação no Cognito
  - Verificar configurações públicas do client
  - Testar endpoints públicos do Cognito

**Redirect URI:** `https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse`
- ⚠️ **Importante:** Verificar se este endpoint está protegido
- ⚠️ **Teste:** Verificar se redirect_uri pode ser manipulado (Open Redirect)

**State Parameter:**
- Base64 encoded
- Possivelmente contém:
  - CSRF token
  - Dados de sessão
  - Informações de contexto

---

## Testes Recomendados

### 1. Análise do Endpoint de Login
```bash
# Verificar se endpoint está acessível
curl -I https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/login

# Verificar headers de segurança
curl -v https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/login 2>&1 | grep -i "x-"

# Verificar se há rate limiting
# (Testar múltiplas requisições)
```

### 2. Teste de Open Redirect
```bash
# Tentar manipular redirect_uri
# Exemplo: mudar para domínio malicioso
# (Apenas para teste autorizado)
```

### 3. Account Enumeration
```bash
# Testar se é possível enumerar usuários
# Verificar mensagens de erro diferentes para usuários válidos/inválidos
```

### 4. Brute-Force de Autenticação
```bash
# Testar credenciais comuns
# Verificar rate limiting e bloqueios
# (Etapa 13 do guia - Authentication Brute-Force Testing)
```

### 5. Análise do Callback Endpoint
```bash
# Verificar endpoint de callback
curl -I https://desarrolloyempleo.cba.gov.ar/oauth2/idpresponse

# Testar acesso direto (deve retornar erro, mas pode vazar informações)
```

### 6. Verificar Configurações do Cognito
```bash
# Tentar acessar endpoints públicos do Cognito
# Exemplo: /.well-known/openid-configuration
curl https://mj-cba-gov-ar.auth.us-east-2.amazoncognito.com/.well-known/openid-configuration
```

---

## Próximos Passos

1. ✅ **Documentar descoberta** (este arquivo)
2. ⬅️ **Validar endpoint** - Verificar se ainda está ativo
3. ⬅️ **Analisar configuração OAuth2** - Verificar endpoints públicos
4. ⬅️ **Testar funcionalidades** - Account enumeration, brute-force, etc.
5. ⬅️ **Atualizar relatório principal** - Adicionar ao PenetrationTestReport

---

## Referências

- **AWS Cognito:** https://aws.amazon.com/cognito/
- **OAuth2 Specification:** https://oauth.net/2/
- **OpenID Connect:** https://openid.net/connect/

---

**Status:** ✅ **DESCOBERTA DOCUMENTADA**  
**Severidade:** 🟡 **MÉDIA** (Informação de infraestrutura exposta)  
**Próxima Ação:** Validar endpoint e realizar testes de autenticação

