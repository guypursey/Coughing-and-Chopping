
# Set up new draft folder with pre-requisite templates.
cd ./drafts
mkdir $1
cd $1
touch $1.md
touch tags.txt
git init
git add $1.md
git add tags.txt
git commit -m "Added template files to begin writing."