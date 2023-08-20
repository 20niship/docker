FROM debian:12-slim

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# RUN apk update && apk add doxygen graphviz git nodejs npm
RUN apt update && apt install -y doxygen graphviz git nodejs npm
RUN npm install -g http-server


# これ以降はキャッシュされない
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" /dev/null

COPY ./src /app
# RUN git submodule update --init --recursive && \
RUN cd /app && \ 
    git clone https://github.com/jothepro/doxygen-awesome-css.git  && \
    doxygen ./scripts/Doxyfile
RUN export PATH="$PATH:/usr/local/share/npm/bin:/usr/local/bin/"

WORKDIR /app/build/html
# CMD ["http-server", "-p", "80," "--username", "melchior", "--password", "akari"]

