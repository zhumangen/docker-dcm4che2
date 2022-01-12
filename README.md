# Docker Image for dcm4che2

This is a Docker Image of the deprecated
[dcm4che-2.x DICOM toolkit](https://dcm4che.atlassian.net/wiki/spaces/d2/overview).

## Usage

Start an interactive Shell (Bash) with the dcm4che2 toolkit:

    $ docker run --rm -it bjoernalbers/dcm4che2
    root@b6b0369f96a2:/opt/dcm4che-2.0.29# ls
    bin  dtd  etc  lib  var  xml

These are all available tools:

    root@b6b0369f96a2:/opt/dcm4che-2.0.29# ls -1 bin
    dcm2dcm
    dcm2jpg
    dcm2txt
    dcm2xml
    dcmdir
    dcmecho
    dcmgpwl
    dcmhpqr
    dcmmover
    dcmmwl
    dcmof
    dcmqr
    dcmrcv
    dcmsnd
    dcmups
    dcmwado
    esoundex
    esoundex2
    fixjpegls
    jpg2dcm
    kphonetik
    logger
    metaphone
    mkelmdic
    mkuiddic
    mkvrmap
    pdf2dcm
    phonem
    rgb2ybr
    soundex
    txt2dcmsr
    xml2dcm

Run a tool directly:

    $ docker run --rm bjoernalbers/dcm4che2 dcmmwl --version
    dcmqr v2.0.29

    $ docker run --rm bjoernalbers/dcm4che2 dcmmwl --help
    usage: dcmmwl <aet>[@<host>[:<port>]] [Options]
    Query specified remote Application Entity (=Modality Worklist SCP) If
    <port> is not specified, DICOM default port 104 is assumed. If also no
    <host> is specified localhost is assumed.
    Options:
      ...

(The option `--rm` removes the created container after the command has finished.)

You can also use the supplied run script:

    $ ./run dcmmwl --version
    dcmqr v2.0.29

If you need to get some files into the container, then mount a volume to
`/opt/dcm4che/var`, which is inside dcm4che's working directory.
This would for example start a DICOM Modality Worklist (MWL) Service from the
supplied XML files:

    $ ls tmp/dcmof | head
    525737.xml
    525949.xml
    526107.xml
    667729.xml
    667730.xml
    667731.xml
    667732.xml
    667733.xml
    667734.xml
    667735.xml

    $ docker run -v $(pwd)/tmp/dcmof:/opt/dcm4che/var -p 11112:11112 bjoernalbers/dcm4che2 dcmof -mwl var 11112
    Start Server listening on port 11112
    07:23:28,734 INFO   - Start listening on 0.0.0.0/0.0.0.0:11112

Have fun!
