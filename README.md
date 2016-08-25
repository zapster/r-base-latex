Latex docker container with R statistics package
=====

This container helps compiling latex sources without the need to install all latex packages on your system.
It also includes the R statistics package.

Setup
-----

Pull image ([from Docker Hub](https://hub.docker.com/r/zapster/r-base-latex/)):
```bash
$ docker pull zapster/r-base-latex
```
or build:
```bash
$ docker build -t zapster/r-base-latex .

```

Usage:
-----

```bash
$ cd path/to/latex/src

# start container
$ docker run --rm -it -v $(pwd):/home/docker/data -w /home/docker/data zapster/r-base-latex

# use latex in the shell
docker$ pdflatex example.tex
docker$ pdflatex example.tex
```

