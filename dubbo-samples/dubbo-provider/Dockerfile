FROM hub.c.163.com/tonight/oracle_jdk_1.8_131:131
VOLUME /tmp
ADD target/dubbo-provider.jar app.jar
CMD ["java", "-jar", "app.jar"]