#!/bin/bash
set -ev

${CC} --version

${CXX} --version

cmake --version

# update and display enviroment variables
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_RUN_PATH=$LD_RUN_PATH:/usr/local/lib
echo "$LD_LIBRARY_PATH"
echo "$LD_RUN_PATH"

if [ -d "$TRAVIS_BUILD_DIR/deps/" ]; then
  echo "Deps exists and it contains:"
  cd $TRAVIS_BUILD_DIR/deps/
  ls
fi

mkdir $TRAVIS_BUILD_DIR/install-dist/
#mkdir $TRAVIS_BUILD_DIR/deps/

if [ "$(ls -A $TRAVIS_BUILD_DIR/deps/)" ]; then
  echo "Deps is not empty - skipping build"
else
  echo "Deps is empty, building now..."

  #build and install protobuf
  mkdir $TRAVIS_BUILD_DIR/build-proto/
  cd $TRAVIS_BUILD_DIR/build-proto/
  wget https://github.com/google/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.gz -O proto.tar.gz
  tar -xzf proto.tar.gz &> prototar || cat prototar
  mv protobuf-2.6.1 pb
  cd pb/
  pwd
  ls
  autoreconf -i
  ./configure  --prefix=$TRAVIS_BUILD_DIR/deps/ --disable-shared &> config.log|| cat config.log
  make &> proto_build_log || cat proto_build_log
  make check &> proto_check || cat proto_check
  make install

  # build wxWidgtets
  cd $TRAVIS_BUILD_DIR
  mkdir wx3
  cd wx3
  wget https://github.com/wxWidgets/wxWidgets/archive/v3.1.0.tar.gz -O wx.tar.gz
  tar -xzf wx.tar.gz &> wxtar || cat wxtar
  cd wxWidgets-3.1.0
  mkdir gtk-build
  cd gtk-build
  CMAKEOSXARG=""
  if [ "$TRAVIS_OS_NAME" = "osx" ]; then
    CMAKEOSXARG="--with-osx_cocoa --with-macosx-version-min=10.11 --with-macosx-sdk=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk"
  fi
  ../configure --prefix=$TRAVIS_BUILD_DIR/deps/ --enable-webview --disable-compat28 $CMAKEOSXARG
  make
  make install
  # wx-config --version

fi
