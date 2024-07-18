FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY WebContent/ /usr/local/tomcat/webapps/ROOT/
COPY src/ /tmp/src/

ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar \
    /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/mysql-connector-j.jar

RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    && find /tmp/src -name '*.java' > /tmp/sources.list \
    && javac --release 17 -encoding UTF-8 \
        -cp /usr/local/tomcat/lib/servlet-api.jar \
        -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
        @/tmp/sources.list \
    && rm -rf /tmp/src

EXPOSE 8080
