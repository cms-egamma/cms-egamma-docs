cd ../
pip install mkdocs-material
rm -rf cms-egamma.github.io
git clone https://github.com/cms-egamma/cms-egamma.github.io.git
#git clone https://github.com/cms-egamma/cms-egamma.github.io.git
cd cms-egamma.github.io/
git config user.name "a-kapoor";
git config user.email "${akapoor@cern.ch}";
mkdocs gh-deploy --config-file ../cms-egamma-docs/mkdocs.yml --remote-branch master
cd ./../
rm -rf cms-egamma.github.io
cd cms-egamma-docs
