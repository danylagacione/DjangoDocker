FROM python:3.8.5
LABEL maintainer="Danieli C.S. Lagacione"
COPY . /var/www
WORKDIR /var/www

RUN pip install poetry
RUN pip install -r requirements.txt

ENV PORT=8000

EXPOSE $PORT
ENTRYPOINT python manage.py runserver 0.0.0.0:$PORT
