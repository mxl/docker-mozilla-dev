FROM debian:jessie

ENV SRC_DIR /src

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
                                      wget \
                                      python && \
    wget -O bootstrap.py https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py && \
    python bootstrap.py --application-choice browser --no-interactive

COPY bashrc /root/.bashrc

VOLUME $SRC_DIR

WORKDIR $SRC_DIR

CMD /bin/bash
