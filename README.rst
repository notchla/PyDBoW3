
.. image:: https://readthedocs.org/projects/pydbow3/badge/?version=latest
    :target: https://pydbow3.readthedocs.io/?badge=latest
    :alt: Documentation Status

.. image:: https://travis-ci.org/foxis/pyDBoW3.svg?branch=master
    :target: https://travis-ci.org/foxis/pyDBoW3?branch=master

.. image:: https://codecov.io/gh/FoxIS/pyDBoW3/branch/master/graph/badge.svg
  :target: https://codecov.io/gh/foxis/pyDBoW3

.. image:: https://img.shields.io/pypi/v/pyDBoW3.svg
    :target: https://pypi.python.org/pypi/pyDBoW3

.. image:: https://img.shields.io/pypi/l/pyDBoW3.svg
    :target: https://pypi.python.org/pypi/pyDBoW3

.. image:: https://img.shields.io/pypi/pyversions/pyDBoW3.svg
    :target: https://pypi.python.org/pypi/pyDBoW3

.. image:: https://img.shields.io/badge/STAR_Me_on_GitHub!--None.svg?style=social
    :target: https://github.com/foxis/pyDBoW3

------


.. image:: https://img.shields.io/badge/Link-Document-blue.svg
      :target: https://pydbow3.readthedocs.io/index.html

.. image:: https://img.shields.io/badge/Link-API-blue.svg
      :target: https://pydbow3.readthedocs.io/py-modindex.html

.. image:: https://img.shields.io/badge/Link-Source_Code-blue.svg
      :target: https://pydbow3.readthedocs.io/py-modindex.html

.. image:: https://img.shields.io/badge/Link-Install-blue.svg
      :target: `install`_

.. image:: https://img.shields.io/badge/Link-GitHub-blue.svg
      :target: https://github.com/foxis/pyDBoW3

.. image:: https://img.shields.io/badge/Link-Submit_Issue-blue.svg
      :target: https://github.com/foxis/pyDBoW3/issues

.. image:: https://img.shields.io/badge/Link-Request_Feature-blue.svg
      :target: https://github.com/foxis/pyDBoW3/issues

.. image:: https://img.shields.io/badge/Link-Download-blue.svg
      :target: https://pypi.org/pypi/pyDBoW3#files



pyDBoW3
==============

Ultra-fast Boost.Python interface for `DBoW3 <https://github.com/rmsalinas/DBow3>`_

This repo was created in order to interface DBoW algorithm from python in another project
`EasyVision <https://github.com/foxis/EasyVision>`_. It is being used for a simple topological SLAM
implementation since OpenCV BowKMeansTrainer doesn't work with binary features.

If you wish you use it on your own it is as easy as:

.. code-block:: python

    import pyDBoW3 as bow
    voc = bow.Vocabulary()
    voc.load("/slamdoom/libs/orbslam2/Vocabulary/ORBvoc.txt")
    db = bow.Database()
    db.setVocabulary(voc)
    del voc
    # extract features using OpenCV
    ...
    # add features to database
    for features in features_list:
      db.add(features)

    # query features
    feature_to_query = 1
    results = db.query(features_list[feature_to_query])

    del db


This repository was created based on `pyORBSLAM2 <https://github.com/raulmur/ORB_SLAM2>`_ and
ndarray to cv::Mat conversion on `numpy-opencv-converter <https://github.com/GarrickLin/numpy-opencv-converter>`_.

.. note::

  Tested on these platforms:
    * OpenCV 3.4.2.16
    * Windows 10 msvc 2017 x64
    * xenial with Python 2.7, libboost 1.54 (autobuild with travis)
    * xenial with Python 3.5, libboost 1.54 (autobuild with travis)

.. _install:

Get started
-----------

Windows
+++++++

Prerequisites:
* OpenCV
* Python with Numpy and opencv-contrib-python
* Boost >1.54
* cmake
* Microsoft Visual Studio

To build Boost.Python, go to Boost root and run::

    bootstrap.bat --prefix=/dir/to/Boost.Build

Then build Boost.Python like this::

    /dir/to/Boost.Build/b2 --with-python threading=multi variant=release link=static

To build DBoW3, simply run ``build.bat`` file and then build solution folder in ``install/DBoW3/build`` and then the solution
in ``build`` folder.

Currently there is no python package generation, so you could simply copy ``pyDBoW3.pyd`` and ``opencv_world*.dll`` files
to your virtual environment.

Unix
++++

Use ``build.sh`` to build ``build/pyDBoW.so``, which you should then put on your ``PYTHONPATH``.

Check ``.travis.yml`` for environment variables.

Mac OSX
++++
Use ``build.sh`` to build ``build/pyDBoW.so``, which you should then put on your ``PYTHONPATH``.

Check ``.travis.yml`` for environment variables.

.. note::

  You will probably need to run ``sudo make install`` for ``install/opencv/build`` to install it on your system.

Using under a conda environment (to use pre-installed version of OpenCV)
++++
Build a conda environment, adding boost and cmake to it, something like:

.. code-block:: bash
   
   conda create -n test_env python=3.5 opencv=3.3.1 cmake boost matplotlib numpy
   
   ## Unlink system boost installed by brew
   brew unlink boost
   
Use ``build_under_conda.sh`` to build ``build/pyDBoW.dylink`` which is symlinked to ``build/pyDBoW.so``. 
Add this to your conda environment by creating a ``.PTH`` file under ``/Users/<user_name>/anaconda3/envs/test_env/lib/python3.5/site-packages/pydbow3.pth`` containing ``/Users/<user_name>/pyDBoW3/build``


