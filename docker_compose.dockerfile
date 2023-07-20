version: '3.9'

services:
  web:
    image: nginx:latest
    ports:
      - '8080:80'
    volumes:
      - ./src:/var/www/html
      - ./default.conf:/etc/nginx/conf.d/default.conf
    links:
      - php-fpm
  php-fpm:
    image: php:8-fpm
	healthcheck:
	  test: ["CMD", "curl -O http://127.0.0.1:80/ | grep 'works'"]
	  interval: 1m
	  timeout: 5s
	  retries: 3
	build:
	  context: ./devops_module10_compose-main/
	  dockerfile: Dockerfile
    volumes:
      - ./src:/var/www/html
	