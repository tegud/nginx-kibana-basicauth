FROM nginx:1.12.0-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY run.sh /

RUN chmod a+x  /run.sh

ENTRYPOINT ["/run.sh"]
