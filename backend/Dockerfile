FROM python:3-alpine3.8
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN apk update && apk add --no-cache postgresql-libs && \
    apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
    apk add --no-cache build-base python-dev py-pip jpeg-dev zlib-dev && \
    apk add --no-cache postgresql-client && \
    pip install -r requirements.txt
COPY . /code/
ENTRYPOINT [ "/code/entrypoint.sh" ]
