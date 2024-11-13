# Usa uma imagem base com Java 21 para construção
FROM eclipse-temurin:21-jdk AS build

# Define o diretório de trabalho
WORKDIR /app

# Copia o projeto para o diretório de trabalho no container
COPY . /app

# Dá permissão de execução ao script mvnw
RUN chmod +x ./mvnw

# Executa o Maven para construir o projeto
RUN ./mvnw clean install -DskipTests

# Passa para a segunda fase, onde apenas o JAR final é incluído
FROM eclipse-temurin:21-jre

# Define o diretório de trabalho
WORKDIR /app

# Copia o JAR construído na fase anterior
COPY --from=build /app/target/dslist.jar app.jar

# Expõe a porta da aplicação (substitua pela porta que sua aplicação usa)
EXPOSE 8080

# Define o comando de entrada para rodar a aplicação
CMD ["java", "-jar", "app.jar"]