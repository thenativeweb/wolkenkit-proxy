FROM nginx:1.14.2-alpine

ADD ./keys /keys/
ADD ./config/nginx.conf.tpl /tpl/nginx.conf.tpl

CMD envsubst '$API_EXTERNAL_HOST $API_EXTERNAL_PORT $API_CERTIFICATE $API_PRIVATE_KEY $API_CONTAINER_HOST $API_CONTAINER_PORT $DEPOT_CERTIFICATE $DEPOT_PRIVATE_KEY $DEPOT_EXTERNAL_HOST $DEPOT_EXTERNAL_PORT $DEPOT_CONTAINER_HOST $DEPOT_CONTAINER_PORT' < \
    /tpl/nginx.conf.tpl > \
    /etc/nginx/conf.d/default.conf && \
    exec nginx -g 'daemon off;'
