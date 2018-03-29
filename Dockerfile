FROM python

VOLUME ["/carts", "/src"]

RUN git clone https://github.com/dansanderson/picotool.git

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["out.p8"]