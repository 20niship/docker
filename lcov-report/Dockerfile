FROM debian:11-slim
COPY . /app
WORKDIR /app

RUN apt update && apt install libgl-dev mesa-vulkan-drivers libopencv-dev lcov libglu1-mesa-dev libgl1-mesa-dev libglfw3-dev libglew-dev libglm-dev libfreetype6-dev libeigen3-dev libassimp-dev libpcl-dev liblua5.4-dev python3-pip -y
RUN pip install pybind11

RUN mkdir -p ~/.ssh
RUN chown -R root:root ~/.ssh
RUN chmod -R 0700 ~/.ssh
RUN cp -ip /run/secrets/host_ssh_key ~/.ssh/id_rsa
RUN chmod -R 0600 ~/.ssh

# run report.sh
CMD ["./report.sh"]

