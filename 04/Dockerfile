FROM debian

WORKDIR /home/

COPY ./fcgi_hello.c /home/fcgi_hello.c
COPY ./comp_n_run.sh /home/comp_n_run.sh

RUN apt update && apt install -y \
    nginx \
    gcc \
    libfcgi-dev \
    spawn-fcgi \ 
    && chmod +x comp_n_run.sh

CMD [ "/home/comp_n_run.sh" ]