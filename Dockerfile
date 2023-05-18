FROM phenoscape/blazegraph:latest

RUN apt-get -y update && apt-get -y install nginx

COPY blazegraph.properties /data/
COPY entrypoint.sh /
COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 8000/tcp

ENTRYPOINT ["/entrypoint.sh"]
