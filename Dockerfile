# Use uma imagem Python oficial e estável.
# A versão 'alpine' é escolhida por seu tamanho reduzido.
FROM python:3.12-alpine

# Define variáveis de ambiente para evitar a criação de arquivos .pyc
# e para garantir que os logs sejam enviados diretamente para o console.
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que o aplicativo será executado
EXPOSE 8000

# Comando para executar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000","--reload" ]
