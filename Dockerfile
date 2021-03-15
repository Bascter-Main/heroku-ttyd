FROM ubuntu:20.04

ADD shell /home
ADD configure.sh /configure.sh
ADD home.tar.gz /home
COPY script /tmp
RUN apt update \
	&& chmod +x /tmp/bin \
	&& mv /tmp/bin/* /usr/bin \
	&& apt install -y bash wget screen \
	&& mkdir -p /run/screen \
	&& chmod 777 /run/screen \
	&& chmod +x /configure.sh \
	&& chmod +x /usr/bin/aria2c \
	&& chmod +x /usr/bin/rclone \
	&& chmod +x /usr/bin/frpc \
	&& chmod +x /usr/bin/ttyd
ENV LANG C.UTF-8
WORKDIR /home
CMD /configure.sh
