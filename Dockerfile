FROM williamyeh/java7
RUN rm -f /etc/apt/sources.list
COPY sources.list /etc/apt/
RUN apt-get update \
    && apt-get install -y --force-yes unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
ENV PREFIX="/opt"
ENV DCM4CHE_VERSION="2.0.29"
ENV DCM4CHE_BASENAME="dcm4che-${DCM4CHE_VERSION}"
ENV DCM4CHE_ZIPFILE="${DCM4CHE_BASENAME}-bin.zip"
WORKDIR "${PREFIX}"
RUN wget -O "${DCM4CHE_ZIPFILE}" "http://downloads.sourceforge.net/project/dcm4che/dcm4che2/${DCM4CHE_VERSION}/${DCM4CHE_ZIPFILE}" \
    && unzip "${DCM4CHE_ZIPFILE}" \
    && rm "${DCM4CHE_ZIPFILE}" \
    && ln -s "${DCM4CHE_BASENAME}" dcm4che
WORKDIR "${DCM4CHE_BASENAME}"
RUN find bin -iname '*.bat' -delete
ENV PATH="${PATH}:${PREFIX}/${DCM4CHE_BASENAME}/bin"
RUN mkdir var
VOLUME "${PREFIX}/dcm4che/var"
CMD ["bash"]
