
server {
  server_name ${API_EXTERNAL_HOST};
  listen ${API_EXTERNAL_PORT};

  ssl on;
  ssl_certificate ${API_CERTIFICATE};
  ssl_certificate_key ${API_PRIVATE_KEY};

  location / {
    proxy_pass http://${API_CONTAINER_HOST}:${API_CONTAINER_PORT};
    proxy_redirect     off;
    proxy_set_header   Host $host;
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Host $server_name;
  }
}

server {
  server_name ${DEPOT_EXTERNAL_HOST};
  listen ${DEPOT_EXTERNAL_PORT};

  ssl on;
  ssl_certificate ${DEPOT_CERTIFICATE};
  ssl_certificate_key ${DEPOT_PRIVATE_KEY};

  location / {
    proxy_pass http://${DEPOT_CONTAINER_HOST}:${DEPOT_CONTAINER_PORT};
    proxy_redirect     off;
    proxy_set_header   Host $host;
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Host $server_name;
  }
}
