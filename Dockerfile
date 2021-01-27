# https://hub.docker.com/_/openjdk?tab=tags
FROM openjdk:15-jdk-alpine@sha256:fb60cc0750e6a3e90d2c853413f07dfde53ba3dc3c020b2fa20df0027ca0023a

ENV LANG en_US.UTF-8

COPY ./jars/ /jars
RUN mv /jars/plantuml*.jar /jars/plantuml.jar
ARG PLANTUML_VERSION

RUN apk add --no-cache\
  fontconfig\
  graphviz\
  ttf-dejavu\
  && dot -version

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "/jars/plantuml.jar"]
CMD ["-help"]
