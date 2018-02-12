FROM maven:3-jdk-7
RUN mkdir glassfish
RUN git clone https://github.com/javaee/glassfish.git
RUN cd glassfish   \
&& git checkout 4.0 \
&& mvn install \
&& mkdir -p .mvn \
&& echo "-Xmx6g -Xms1g" > .mvn/jvm.config

VOLUME /glassfish
