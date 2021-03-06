FROM openjdk:8

# 时区设置
RUN echo "Asia/shanghai" > /etc/timezone && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 8080
VOLUME /tmp
#RUN curl -fsSL -o /app.jar http://edas-public.oss-cn-hangzhou.aliyuncs.com/install_package/demo/sentinel-dashboard.jar
RUN curl -fsSL -o /app.jar https://github.com/alibaba/Sentinel/releases/download/1.6.1/sentinel-dashboard-1.6.1.jar

#RUN sh -c 'touch /app.jar'
#ENV JAVA_OPTS=""


ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-Dcsp.sentinel.dashboard.server=localhost:8080", "-Dproject.name=sentinel-dashboard","-jar","/app.jar"]
