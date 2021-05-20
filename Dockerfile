FROM python:3.8.5
LABEL maintainer="Danieli C.S. Lagacione"

ENV PYTHONUNBUFFERED 1

COPY . /var/www
WORKDIR /var/www

RUN pip install poetry

COPY poetry.lock pyproject.toml ./

RUN poetry export -f requirements.txt --output requirements.txt 
RUN pip install -r requirements.txt 

ENV PORT=8000
EXPOSE $PORT

# CMD python manage.py runserver 0.0.0.0:$PORT