cd ..
pip install mkdocs-material
rm -rf cms-egamma.github.io
gh auth login
gh repo clone cms-egamma/cms-egamma.github.io
#git clone https://github.com/cms-egamma/cms-egamma.github.io.git
cd cms-egamma.github.io/
mkdocs gh-deploy --config-file ../cms-egamma-docs/mkdocs.yml --remote-branch master
cd ./../cms-egamma-docs
