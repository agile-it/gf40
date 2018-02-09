FROM maven:3-jdk-7
RUN git clone -b 4.0 https://github.com/javaee/glassfish.git
RUN cd glassfish
RUN mvn install
