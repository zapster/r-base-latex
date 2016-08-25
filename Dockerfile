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

ENV R_LIBS="/home/docker/R_libs"
RUN mkdir -p $R_LIBS
RUN Rscript -e 'install.packages(c("ggplot2","reshape2","dplyr","RColorBrewer"), repos="http://cran.rstudio.com/", clean=TRUE)'

CMD ["bash"]
