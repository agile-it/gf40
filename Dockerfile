FROM maven
RUN mkdir glassfish
RUN git clone https://github.com/javaee/glassfish.git
RUN git checkout 5.0-b06 \
&& cd glassfish \
&& mvn install \
&& mkdir -p .mvn \
&& echo "-Xmx6g -Xms1g" > .mvn/jvm.config \
&& mvn sonar:sonar -Dsonar.host.url=http://piccocloud.de:33333 -Dsonar.projectKey=gf1 -Dsonar.projectDate=`git show --format=%cd --no-notes --date=short 5.0-b06 | head -1`

VOLUME /glassfish
