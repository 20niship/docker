FROM debian:11-slim

RUN apt update && apt install libgl-dev mesa-vulkan-drivers libopencv-dev lcov libglu1-mesa-dev libgl1-mesa-dev libglfw3-dev libglew-dev libglm-dev libfreetype6-dev libeigen3-dev libassimp-dev libpcl-dev liblua5.4-dev python3-pip npm -y
RUN pip install pybind11 && npm install -g http-server

COPY . /app
WORKDIR /app
# run report.sh
CMD ["./report.sh"]

