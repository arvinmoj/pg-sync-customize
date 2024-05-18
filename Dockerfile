FROM python:3.9
ARG WORKDIR=/code
RUN mkdir $WORKDIR
ADD ./examples/ $WORKDIR/examples
WORKDIR $WORKDIR
RUN pip install git+https://gitlab.payrad.org/devops/devops-develop/pg-sync.git
COPY ./docker/wait-for-it.sh wait-for-it.sh
COPY ./docker/runserver.sh runserver.sh
RUN chmod +x wait-for-it.sh
RUN chmod +x runserver.sh
