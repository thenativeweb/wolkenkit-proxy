FROM nginx:1.14.2-alpine

ADD ./keys /keys/
ADD ./config/nginx.conf.tpl /tpl/nginx.conf.tpl

CMD envsubst '$API_HOST $API_PORT $API_CONTAINER_HOST $API_CONTAINER_PORT $DEPOT_API_PORT $DEPOT_API_CONTAINER_HOST $DEPOT_API_CONTAINER_PORT' < \
    /tpl/nginx.conf.tpl > \
    /etc/nginx/conf.d/default.conf && \
    exec nginx -g 'daemon off;'
