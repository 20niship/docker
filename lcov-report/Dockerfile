FROM ubuntu:22.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install software-properties-common -y \
    add-apt-repository ppa:apt-fast/stable  && \
    apt-get update  && \
    apt-get -y install apt-fast

RUN apt-fast install libgl-dev mesa-vulkan-drivers libopencv-dev lcov libglu1-mesa-dev libgl1-mesa-dev libglfw3-dev libglew-dev libglm-dev libfreetype6-dev libeigen3-dev libassimp-dev libpcl-dev liblua5.4-dev python3-pip npm git cmake make wget -y
RUN pip install pybind11 && npm install -g http-server

COPY . /app
WORKDIR /app
CMD ["./report.sh"]

