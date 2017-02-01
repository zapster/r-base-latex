FROM r-base:3.3.1
MAINTAINER Josef Eisl <zapster@zapster.cc>

RUN apt-get update -q && apt-get install -qy \
  curl \
  gnupg \
  imagemagick \
  librsvg2-bin \
  make \
  python-pygments \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER docker

# setup R local lib
ENV R_LIBS="/home/docker/R_libs"
RUN mkdir -p $R_LIBS

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

# install R packages
RUN Rscript -e 'install.packages(c(
  "dplyr",
  "ggplot2",
  "reshape2",
  "RColorBrewer"
  ), repos="http://cran.rstudio.com/", clean=TRUE)'
# install extra packages
RUN tlmgr update --all && tlmgr install \
  algorithms \
  biber \
  biblatex \
  boondox \
  comment \
  csquotes \
  ecv \
  enumitem \
  environ \
  fontaxes \
  hyperxmp \
  ifplatform \
  inconsolata \
  lastpage \
  libertine \
  logreq \
  minted \
  mweights \
  ncctools \
  newtx \
  paralist \
  pgfplots \
  preprint \
  preview \
  relsize \
  silence \
  sttools \
  titlesec \
  totpages \
  trimspaces \
  upquote \
  xstring



CMD ["bash"]
