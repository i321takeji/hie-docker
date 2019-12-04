FROM bamboog130/haskellstack:lts-14.16

RUN sed -i.bak -e "s%http://.*.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends \
  libgmp-dev \
  libicu-dev \
  libtinfo-dev \
  zlib1g-dev \
&& apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
&& git clone https://github.com/haskell/haskell-ide-engine.git --recurse-submodules /usr/local/haskell-ide-engine

WORKDIR /usr/local/haskell-ide-engine

RUN stack ./install.hs hie-8.6.5 \
&& stack ./install.hs build-data

WORKDIR /workdir
CMD ["bash"]
