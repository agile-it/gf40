FROM maven

ENV VERS 5.0-b06

RUN mkdir glassfish
RUN git clone https://github.com/javaee/glassfish.git
RUN git checkout "$VERS" \
&& cd glassfish \
&& mvn versions:set -DnewVersion="$VERS" \
&& mvn install \
&& mkdir -p .mvn \
&& echo "-Xmx6g -Xms1g" > .mvn/jvm.config \
&& mvn sonar:sonar -Dsonar.host.url=http://piccocloud.de:33333 -Dsonar.projectKey=gf1 -Dsonar.projectDate=`git show --format=%cd --no-notes --date=short "$VERS" | head -1`

VOLUME /glassfish
