FROM greyltc/archlinux

RUN pacman -Syu --noconfirm base-devel

# glad dependencies
RUN pacman -Syu --noconfirm python python-jinja python-lxml
# test dependencies
RUN pacman -Syu --noconfirm \
    xorg-server-xvfb \
    gcc glfw-x11


WORKDIR /mnt
VOLUME /mnt

ADD run /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]
CMD ["./utility/test.sh"]

