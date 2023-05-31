#! /bin/bash

# repo環境変数をcloneする
echo "cloning repo : $repo"
export GIT_SSH_COMMAND="ssh -i /root/.ssh/id_rsa -o StrictHostKeyChecking=no"
git clone $repo /src

# git cloneが失敗したら終了
if [ $? -ne 0 ]; then
  echo "git clone failed exitting......"
  sleep 100000
  exit 1
fi

cd /src

git submodule update --init --recursive

mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j8
ctest --output-on-failure

# generate html file
lcov --capture --directory . --output-file lcov.info
genhtml lcov.info -o html

cd html 
http-server -p 80

