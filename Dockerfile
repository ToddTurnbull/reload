FROM postgres

RUN apt-get update -y
RUN apt-get -y install python3 postgresql-plpython3-14
