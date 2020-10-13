FROM python:alpine

ENV PYTHONUNBUFFERED=1
RUN mkdir /code
ADD . /code

WORKDIR /code

RUN pip install -r requirements.txt

CMD [ "gunicorn", "-c", "docker/gunicorn/conf.py", "--bind", ":8000", "--chdir", "config", "wsgi:application" ]
