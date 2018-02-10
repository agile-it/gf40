FROM maven:3-jdk-7
RUN mkdir glassfish
RUN git https://github.com/javaee/glassfish.git
RUN git checkout 4.1.1 \
&& cd glassfish \
&& mvn install \
&& mkdir -p .mvn \
&& echo "-Xmx6g -Xms1g" > .mvn/jvm.config

VOLUME /glassfish
