FROM lwieske/java-8:jre-8u202

RUN yum update -y && yum install -y wget unzip && yum clean all
