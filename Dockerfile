FROM public.ecr.aws/docker/library/python:3.12.3

RUN apt update -y && \
    apt install -y build-essential libpq-dev && \
    pip install --upgrade pip setuptools wheel

WORKDIR /usr/src/app

COPY analytics .

RUN pip install -r requirements.txt

ENV DB_USERNAME=rootuser
ENV DB_PASSWORD=rootpassword
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=udacitydb

EXPOSE 5153

CMD ["python", "app.py"]