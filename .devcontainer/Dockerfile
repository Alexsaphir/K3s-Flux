ARG VARIANT="bookworm"
ARG FLAVOR="curl"

FROM buildpack-deps:${VARIANT}-${FLAVOR}

RUN apt-get update && apt-get install -y sudo
