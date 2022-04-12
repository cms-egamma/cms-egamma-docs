cd ../
pip install mkdocs-material
rm -rf cms-egamma.github.io
#git clone https://github.com/cms-egamma/cms-egamma.github.io.git
git clone git@github.com:cms-egamma/cms-egamma.github.io.git
#git config user.name github-actions
#git config user.email github-actions@github.com
cd cms-egamma.github.io/
ls
#mkdocs gh-deploy --config-file ../cms-egamma-docs/mkdocs.yml --remote-branch master
cd ./../
rm -rf cms-egamma.github.io
cd cms-egamma-docs
