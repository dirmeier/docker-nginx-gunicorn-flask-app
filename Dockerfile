FROM ubuntu
 
RUN apt-get update &&  \
	 apt-get install -y nginx && \
 	 apt-get install -y python3.5 && \
	 apt-get install -y python-dev && \
	 apt-get install -y python-flask && \
	 apt-get install -y python-pip && \
	 pip install numpy && \
	 pip install flask-cors && \	 
	 pip install gunicorn && \	 
	 apt-get install -y curl

RUN mkdir /source/

COPY proxy/supervisord.conf /etc/supervisord.conf
COPY proxy/nginx.conf /etc/nginx/nginx.conf
COPY proxy/app /etc/nginx/sites-available/default

COPY app /source/app
COPY run.sh /source/run.sh

EXPOSE 80

CMD ["/source/run.sh",  "--docker"]
