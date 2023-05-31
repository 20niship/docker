#! /bin/bash

# repo環境変数をcloneする
echo "cloning repo : $repo"
git clone $repo /src
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

