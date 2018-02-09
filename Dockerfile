FROM maven:3-jdk-7
RUN mkdir glassfish
RUN git clone -b 4.0 https://github.com/javaee/glassfish.git \
&& cd glassfish \
&& mvn install \
&& echo "-Xmx6g -Xms1g" > .mvn/jvm.config

VOLUME /glassfish
