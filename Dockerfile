FROM maven

ENV VERS 5.0-b06

RUN mkdir glassfish
RUN git clone https://github.com/javaee/glassfish.git
RUN cd glassfish \
&&  git checkout "$VERS"\
&& cd main \
&& mvn versions:set -DnewVersion="$VERS" \
&& mkdir -p .mvn \
&& echo "-Xmx4g -Xms1g" > .mvn/jvm.config \
&& mvn install \
&& rm -rf /root/.m2 \
&& mvn sonar:sonar -Dsonar.host.url=http://piccocloud.de:33333 -Dsonar.projectKey=gf1 -Dsonar.projectDate=`git show --format=%cd --no-notes --date=short "$VERS" | head -1`\
&& rm -rf /root/.m2 /root/.Dsonar


VOLUME /glassfish
