FROM debian:11-slim

RUN apt update && apt install doxygen graphviz npm -y
RUN npm install -g http-server

COPY . /app
WORKDIR /app
CMD ["bash", "/app/gen_doxygen.sh"]

