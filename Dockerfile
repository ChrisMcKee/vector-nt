# escape=`
ARG OSVERSION=nanoserver:ltsc2019

FROM mcr.microsoft.com/windows/$OSVERSION

ARG VECTOR_VERSION=0.26.0

ADD https://github.com/vectordotdev/vector/releases/download/v$VECTOR_VERSION/vector-$VECTOR_VERSION-x86_64-pc-windows-msvc.zip /vector/vector.zip

WORKDIR "/vector"

RUN tar.exe -xf vector.zip -C "/vector/" && `
    del vector.zip

RUN ["/vector/bin/vector.exe", "--version"]

WORKDIR "/vector/bin"
CMD ["/vector/bin/vector.exe", "--config /vector/config/vector.toml"]
