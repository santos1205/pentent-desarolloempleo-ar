# Etapa 19: Teste de Vulnerabilidades Especializadas

## Ferramentas Utilizadas

1. **Fuxploider** - Teste de upload de arquivos
2. **AWSBucketDump** - Descoberta de buckets S3 expostos
3. **GitDumper** (GitTools) - Download de repositórios .git expostos
4. **GitFinder** (GitTools) - Descoberta de repositórios .git expostos

## Contexto do Alvo

- **WordPress 6.8.3** - Pode ter endpoints de upload
- **AWS CloudFront** - Infraestrutura AWS, pode usar S3
- **wp-content/uploads/** - Diretório de uploads WordPress identificado
- **Infraestrutura AWS** - Possível uso de S3 buckets

## Arquivos

- `upload_endpoints.txt` - Endpoints WordPress para testar upload
- `s3_bucket_names.txt` - Wordlist de nomes de buckets S3
- `git_endpoints.txt` - Endpoints .git para testar
- `run_tests_gitbash.sh` - Script para executar todos os testes (Git Bash)
- `COMANDOS_MANUAIS.md` - Comandos individuais para execução manual

## Execução

### Git Bash:
```bash
cd reports/etapa19_vulnerabilidades_especializadas
chmod +x run_tests_gitbash.sh
./run_tests_gitbash.sh
```

### Execução Manual:
Ver `COMANDOS_MANUAIS.md` para comandos individuais.

## Resultados Esperados

Os resultados serão salvos em:
- `fuxploider_results.txt` - Resultados do Fuxploider
- `awsbucketdump_results.txt` - Resultados do AWSBucketDump
- `gitdumper_results/` - Diretório com repositórios .git baixados (se encontrados)
- `gitfinder_results.txt` - Resultados do GitFinder
- `git_head_test.txt` - Resultado do teste manual de .git/HEAD
