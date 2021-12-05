FROM openjdk:11
WORKDIR /API
VOLUME /tmp
ADD target/phonebook-0.0.1-SNAPSHOT.jar phonebook.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","phonebook.jar"]