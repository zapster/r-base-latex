FROM r-base:3.3.1
MAINTAINER Josef Eisl <zapster@zapster.cc>

RUN apt-get update -q && apt-get install -qy \
  python-pygments \
  gnuplot \
  make \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]

USER docker

# install R packages
ENV R_LIBS="/home/docker/R_libs"
RUN mkdir -p $R_LIBS
RUN Rscript -e 'install.packages(c("ggplot2","reshape2","dplyr","RColorBrewer"), repos="http://cran.rstudio.com/", clean=TRUE)'

# install texlive
COPY ./medium.profile /tmp/
RUN mkdir -p /tmp/texlive \
  | curl -SL http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
  | tar -xzC /tmp/texlive \
  && /tmp/texlive/install-tl-*/install-tl -profile /tmp/medium.profile \
  && rm -rf /tmp/texlive
ENV PATH=/home/docker/usr/local/texlive/current/bin/x86_64-linux:$PATH \
    INFOPATH=/home/docker/usr/local/texlive/current/texmf-dist/doc/info:$INFOPATH \
    MANPATH=/home/docker/usr/local/texlive/current/texmf-dist/doc/man:$MANPATH

# install extra packages
RUN tlmgr update --all && tlmgr install \
  algorithms \
  biblatex \
  biber \
  logreq \
  csquotes \
  comment \
  hyperxmp \
  minted \
  ifplatform \
  xstring \
  pgfplots \
  preprint \
  relsize \
  sttools

CMD ["bash"]
