FROM lwieske/java-8:jre-8u202

ENV PREFIX="/opt"
ENV DCM4CHE_VERSION="2.0.29"
ENV DCM4CHE_BASENAME="dcm4che-${DCM4CHE_VERSION}"
ENV DCM4CHE_ZIPFILE="${DCM4CHE_BASENAME}-bin.zip"

RUN yum update -y \
    && yum install -y wget unzip \
    && yum clean all
WORKDIR "$PREFIX"
RUN wget -O "$DCM4CHE_ZIPFILE" "https://downloads.sourceforge.net/project/dcm4che/dcm4che2/${DCM4CHE_VERSION}/${DCM4CHE_ZIPFILE}" \
    && unzip "$DCM4CHE_ZIPFILE" \
    && rm "$DCM4CHE_ZIPFILE"
WORKDIR "$DCM4CHE_BASENAME"
