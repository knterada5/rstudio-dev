FROM rocker/rstudio

ARG UID=1000
ARG GID=1000
ARG PSWD=pswd

RUN apt update \
    && apt install -y sudo \
    libcurl4-openssl-dev \
    libxml2-dev \
    libxt-dev \
    git \
    zlib1g-dev \
    openssh-client \
    && echo "rstudio ALL=(ALL) ALL" >> /etc/sudoers \
    && echo "rstudio:${PSWD}" | chpasswd \
    && R -e "install.packages('renv')" \
    && mkdir -p /home/rstudio/.cache/R/renv \
    && chown -R ${UID}:${GID} /home/rstudio/.cache/

