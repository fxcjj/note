FROM registry-srv:5000/openjdk:8
MAINTAINER victor
# 工作目录，进入容器时会进入到此目录
WORKDIR /app/user
# 指定挂载点，使此目录具有持久化存储数据的功能，在容器关闭后，里面的数据还存在
VOLUME /tmp/data
ADD sb08-0.0.1-SNAPSHOT.jar ./app08.jar
# RUN bash -c 'touch /app08.jar'
# 声明容器端口，仅仅是声明
EXPOSE 1908
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app08.jar"]