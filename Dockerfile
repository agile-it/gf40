FROM maven
RUN mkdir glassfish
RUN git clone -b 5.0-b06 https://github.com/javaee/glassfish.git \
&& cd glassfish \
&& mvn install \
&& mkdir -p .mvn \
&& echo "-Xmx6g -Xms1g" > .mvn/jvm.config

VOLUME /glassfish
