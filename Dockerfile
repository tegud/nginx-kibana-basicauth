FROM nginx:stable

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY run.sh /

ENTRYPOINT ["/run.sh"]
