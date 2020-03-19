FROM fedora:27

################################################################################
## build obliv-c

RUN dnf install -y git gcc make
RUN git clone --depth 1 https://github.com/samee/obliv-c.git

RUN dnf install -y\
        glibc-devel.i686\
        ocaml\
        ocaml-ocamldoc\
        libgcrypt-devel\
        perl-ExtUtils-MakeMaker\
        perl-Data-Dumper\
        opam\
        m4\
        patch\
        unzip

RUN opam init -y && eval $(opam env)
RUN opam install -y batteries

RUN cd obliv-c &&\
        eval $(opam env) &&\
        ./configure &&\
        make

