FROM maven:3-jdk-8-slim

WORKDIR /build
COPY . /build

CMD mvn test 
