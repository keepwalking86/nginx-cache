FROM nginx:latest

RUN mkdir -p /etc/nginx/sites-enabled/
RUN mkdir -p /store/files && mkdir -p /store/cache/
RUN chown -R nginx:nginx /store/files
ADD ./nginx.conf /etc/nginx/
ADD ./sites-enabled/ /etc/nginx/sites-enabled/

#Change nginx uid & gid
#RUN usermod -u 1000 nginx && groupmod -g 1000 nginx

##Clearing the apt-get caches
#RUN apt-get clean

## Expose ports
EXPOSE 80
