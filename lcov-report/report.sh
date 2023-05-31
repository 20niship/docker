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

mkdir build && cd build
git checkout develop
git submodule update --init --recursive

cmake .. -DCMAKE_BUILD_TYPE=Coverage
cd tests
make -j8
ctest --output-on-failure

# generate html file
lcov --capture --directory . --output-file lcov.info

# サードパーティと/usr/includeディレクトリのCoverageを除外
lcov --remove lcov.info '/usr/include*' '/src/build/' '11*' 'spdlog*' -o extract.info

genhtml lcov.info -o html

cd html 
http-server -p 80

