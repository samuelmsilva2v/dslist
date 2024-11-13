# Usar uma imagem base com Java 21
FROM eclipse-temurin:21-jdk AS build

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o projeto para o container
COPY . /app

# Executar o Maven para construir o projeto
RUN ./mvnw clean install -DskipTests

# Definir o ponto de entrada para executar o jar da aplicação
CMD ["java", "-jar", "target/dslist.jar"]