# 베이스 이미지 설정(https://hub.docker.com/_/openjdk, D2hub 그룹 생성 및 푸시해야됨.)
FROM openjdk:17-ea-slim-buster

COPY gradlew .
COPY build.gradle .
COPY gradle gradle
COPY settings.gradle .
COPY src src

# 작업 디렉터리 설정
WORKDIR /
RUN chmod +x ./gradlew
RUN ./gradlew clean :bootJar
RUN pwd

# Gradle 빌드 결과물 복사
RUN cp /build/libs/dktwp_work_mate-0.0.1-SNAPSHOT.jar app.jar

# TimeZone 변경
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 애플리케이션 시작 명령어
ENTRYPOINT ["java", "-jar", "app.jar"]
