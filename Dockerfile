FROM lwieske/java-8:jre-8u202

RUN yum update -y && yum install -y wget unzip && yum clean all

RUN cd /opt && \
  wget -O dcm4che-2.0.29-bin.zip http://downloads.sourceforge.net/project/dcm4che/dcm4che2/2.0.29/dcm4che-2.0.29-bin.zip && \
  unzip dcm4che-2.0.29-bin.zip && \
  rm dcm4che-2.0.29-bin.zip
