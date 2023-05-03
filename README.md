PyDBoW3
==============

This repo is a fork of [this](https://github.com/xingruiy/PyDBoW3) adapted no opencv4 and added a cmake to find numpy

## Get started

```python
import pydbow3 as bow
voc = bow.Vocabulary()
voc.load("PyDBoW3/modules/dbow3/orbvoc.dbow3")
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

## Install

+ clone the repo with `--recursive`
+ build and install `modules/DBoW3` using `dbow.sh`
+ install with `pip install .` 
+ currently only `*nix` is supported

## Acknowledgement

This work is based on https://github.com/foxis/pyDBoW3
and https://github.com/edmBernard/ybind11_opencv_numpy.git
