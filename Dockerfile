FROM base/devel:latest

LABEL maintainer="36web.rocks@gmail.com" \
  org.label-schema.name="AUR package builder" \
  org.label-schema.url="https://aur.archlinux.org/" \
  org.label-schema.vcs-url="https://github.com/36web/docker-aurpkg.git" \
  org.label-schema.docker.cmd="docker run --rm --init -v $PWD:/pkg -e USER_ID=`id -u` -e GROUP_ID=`id -g` 36web/aurpkg PACKAGE_NAME"

COPY aurpkg.sh /

RUN useradd -M aur \
  && mkdir /pkg \
  && chown aur:aur /pkg \
  && echo 'aur ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/aur \
  && chmod +x /aurpkg.sh

USER aur

WORKDIR /tmp

VOLUME [ "/pkg" ]

ENTRYPOINT [ "/aurpkg.sh" ]
