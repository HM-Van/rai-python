# python bindings to rai

This repo exposes some functionality of the RAI code in python bindings. See https://github.com/MarcToussaint/rai for a README of the RAI code.

The current focus of the development is to provide simpler interfaces to Logic-Geometric Programming. The repo https://github.com/MarcToussaint/18-RSS-PhysicalManipulation stores the original code for the experiments in the RSS'18 paper. Here the aim are clean user interfaces and tutorials (both, C++ and python).

If you're interested to contribute in development or testing, consider joining the "LGP code" mailing list https://groups.google.com/forum/#!forum/lgp-code.

## Demo videos

https://ipvs.informatik.uni-stuttgart.de/mlr/lgp/

## Quick Start

This assumes a standard Ubuntu 18.04 machine.

Create virtual environment by following the instructions on https://github.com/HM-Van/rai-python/blob/master/conda_env/readme

Installation

```
git clone https://github.com/HM-Van/rai-python.git
cd rai-python

# skip the following if you have ssh authorization to github
git config --file=.gitmodules submodule.rai.url https://github.com/HM-Van/rai.git
git config --file=.gitmodules submodule.v_MA.url https://github.com/HM-Van/v_MA.git
git config --file=.gitmodules submodule.rai-robotModels.url https://github.com/MarcToussaint/rai-robotModels.git

git submodule init

#git remote add upstream https://github.com/MarcToussaint/rai-python.git
#git remote -v
#git fetch upstream
#git submodule update
#cd rai
#git remote add upstream https://github.com/MarcToussaint/rai.git
#git remote -v
#git fetch upstream

git submodule update

#see below how to enable bullet

#make sure to use standard Ubuntu python3 (i.e. remove anaconda from he PATH in .bashrc) and to close any virtual environment
conda deactivate
make -j1 installUbuntuAll  # calls sudo apt-get install; you can always interrupt
make -j4                     # builds libs and tests
 
```

Also test the cpp versions:
```
cd cpp/pickAndPlace
make
./x.exe
```

To enable bullet, before you compile rai-python, first install bullet locally following
https://github.com/MarcToussaint/rai-maintenance/blob/master/help/localSourceInstalls.md
Then, in 'rai-python/', call
```
echo "BULLET = 1" >> config.mk
```
Then compile.

## Updating after a pulling a new version

```
git submodule update
make -C rai dependAll
make -j4
```
This avoids a full make clean -- but if that doesn't work, hopefully `make clean && make -j4` will do.


## Tutorials

* [Python examples](docs/)
* [A few cpp examples](cpp/)

## Older/messy docs

Just as a reference: https://github.com/MarcToussaint/rai-maintenance/tree/master/help
