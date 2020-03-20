FROM fedora:24

################################################################################
## build obliv-c

RUN dnf install -y git gcc make

RUN dnf install -y\
        glibc-devel.i686\
        ocaml\
        ocaml-ocamldoc\
        libgcrypt-devel\
        perl-ExtUtils-MakeMaker\
        perl-Data-Dumper\
        m4\
        patch\
        unzip\
        tar\
        xz

RUN curl -sL "https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh" | bash
RUN opam init --disable-sandboxing -y
RUN opam install -y batteries


RUN git clone https://github.com/samee/obliv-c.git
RUN git clone https://github.com/samee/sqrtOram

RUN cd obliv-c &&\
        git checkout 601c81a &&\
        eval $(opam env) &&\
        ./configure &&\
        make

################################################################################
## build sqrtOram

RUN cd sqrtOram &&\
        export OBLIVC_PATH=/obliv-c &&\
        make

# build tests
COPY build.sh sqrtOram/build.sh
RUN cd sqrtOram && bash build.sh

# copy tests over
COPY run.sh sqrtOram/run.sh
