# configure your name and email if you have not done so
git config --global user.email "zb2223@columbia.edu"
git config --global user.name "jtr13"

# clone the repository to the book-output directory
git clone -b master \
  https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git \
  book-output
cd book-output
git rm -rf *
cp -r ../docs/* ./
git add --all *
git commit -m "render book with Travis"
git push -q origin master