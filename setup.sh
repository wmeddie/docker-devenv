#!/usr/bin/env bash
set -euo pipefail

# Fix CuDNN by monkeypatching this link...
ln -s /usr/local/cuda /usr/local/nvidia
  
pip install beakerx==1.4.1
pip install ipywidgets==7.5.1
pip install cython==0.29.14
pip install pandas==0.25.3
pip install py4j==0.10.8.1
pip install requests==2.22.0
pip install matplotlib==3.1.2

beakerx install

pip install jupyterlab==1.2.4
pip install jupyter_http_over_ws
jupyter serverextension enable --py jupyter_http_over_ws
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install beakerx-jupyterlab

pip install tensorflow-gpu==1.15.0
