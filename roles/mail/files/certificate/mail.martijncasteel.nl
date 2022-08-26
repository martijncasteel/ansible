server {
  listen 80;
  listen [::]:80;
    
  server_name mail.martijncasteel.nl mail.ambernorder.nl mail.ateliermarcelle.nl;
  root /usr/share/nginx/html;
    
  location ^~ /.well-known/acme-challenge/ {
    default_type "text/plain";
    try_files $uri =404;
    break;
  }

  location / {
    return 444;
  }
}