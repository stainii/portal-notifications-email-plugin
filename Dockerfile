FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 2004
ARG JAR_FILE
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar", "--mail.recipient=${EMAIL_RECIPIENT}", "--mail.sender=${EMAIL_SENDER}", "--mail.subject=${EMAIL_SUBJECT}", "--spring.mail.host=${EMAIL_HOST}", "--spring.mail.port=${EMAIL_PORT}", "--spring.mail.username=${EMAIL_USERNAME}", "--spring.mail.password=${EMAIL_PASSWORD}", "--spring.mail.properties.mail.smtp.auth=${EMAIL_SMTP_AUTH}", "--spring.mail.properties.mail.smtp.starttls.enable=${EMAIL_STARTTLS}"]
