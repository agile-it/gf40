FROM maven:3-jdk-7
RUN git clone -b 4.0 https://github.com/javaee/glassfish.git \
&& cd glassfish \
&& mvn install
