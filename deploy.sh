sed -i '1d' docs/index.md
sed -i '1d' docs/index.md
#sed -i "1s|^|$(date +%D) |" docs/index.md
DateIs=$(date +"%d-%m-%Y")
echo $DateIs
sed -i "1s/^/Documentation last updated on $DateIs \n\n/" docs/index.md
cd ../
pip install mkdocs-material
rm -rf cms-egamma.github.io
git clone https://github.com/cms-egamma/cms-egamma.github.io.git

#git clone git@github.com:cms-egamma/cms-egamma.github.io.git
#git@github.com:cms-egamma/cms-egamma.github.io.git
#git config user.name github-actions
#git config user.email github-actions@github.com
cd cms-egamma.github.io/
ls
mkdocs gh-deploy --config-file ../cms-egamma-docs/mkdocs.yml --remote-branch master
cd ./../
rm -rf cms-egamma.github.io
cd cms-egamma-docs
