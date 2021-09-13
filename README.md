PyDBoW3
==============

This repo functions mostly the same with [this](https://github.com/foxis/pyDBoW3), but is less heavy. It does not rely on `Boost`, I have re-written most of the code to utilise the power of `pybind11`.

## Get started

```python
import pydbow3 as bow
voc = bow.Vocabulary()
voc.load("ORBvoc.txt")
db = bow.Database()
db.setVocabulary(voc)
# extract features using OpenCV
...
# add features to database
for features in features_list:
   db.add(features)

# query features
feature_to_query = 1
results = db.query(features_list[feature_to_query])
```

## Prerequisites:
* OpenCV 
* CMake 
* DBoW3

## Install

+ clone the repo with `--recursive`
+ build and install `modules/DBoW3`
+ install with `pip install .` 
+ currently only `*nix` is supported

.. note::

  You will probably need to run ``sudo make install`` for ``install/opencv/build`` to install it on your system.

## Acknowledgement

This work is based on https://github.com/foxis/pyDBoW3
and https://github.com/edmBernard/ybind11_opencv_numpy.git