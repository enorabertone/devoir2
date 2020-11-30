FROM python:latest

RUN pip install psycopg2

#Postgres have to accept entrants connections before connect itself
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]

CMD ["python", "-m", "__init__.py"]
CMD ["python", "-m", "__main__.py"]