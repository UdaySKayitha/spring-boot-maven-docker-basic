#This stage uses the ubuntu image and is labelled as 'build'
FROM ubuntu:latest 

#Install the dependencies
RUN apt update -y && apt install openjdk-21-jdk -y && apt install maven -y

#Sets the working directory inside the container
WORKDIR /app

#Copies files and directories to the container
COPY . /app

#Create the Build Package or Artefact using Maven
RUN mvn clean package -DSkipTests

#Expose the port that App runs on
EXPOSE 8080

#Executable to run the Application
ENTRYPOINT ["java", "-jar", "lcspringboot.jar"]

