cd modules/dbow3 && mkdir -p build && cd build
cmake -DBUILD_SHARED_LIBS=OFF \
      -DUSE_CONTRIB=ON \
      -DCMAKE_CXX_FLAGS="-fPIC" \
      -DCMAKE_C_FLAGS="-fPIC" \
      -DBUILD_UTILS=OFF .. && make && make install 
