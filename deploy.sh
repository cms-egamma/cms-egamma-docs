#!/bin/bash

source /eos/cms/store/group/phys_egamma/akapoor/miniconda3/etc/profile.d/conda.sh
conda activate mkdocs
mkdocs build
cp -r site/* ./../
