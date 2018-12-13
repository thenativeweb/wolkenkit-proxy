server {
  server_name ${API_HOST};
  listen ${API_PORT};

  ssl on;
  ssl_certificate /keys/local.wolkenkit.io/certificate.pem;
  ssl_certificate_key /keys/local.wolkenkit.io/privateKey.pem;

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
  server_name ${API_HOST};
  listen ${DEPOT_API_PORT};

  ssl on;
  ssl_certificate /keys/local.wolkenkit.io/certificate.pem;
  ssl_certificate_key /keys/local.wolkenkit.io/privateKey.pem;

  location / {
    proxy_pass http://${DEPOT_API_CONTAINER_HOST}:${DEPOT_API_CONTAINER_PORT};
    proxy_redirect     off;
    proxy_set_header   Host $host;
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Host $server_name;
  }
}
