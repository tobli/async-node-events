#!/usr/bin/env bash

npm test
docco ./lib/async-node-events.js
git stash
git checkout gh-pages
rm docco.css index.html
mv docs/docco.css docco.css
mv docs/async-node-events.html index.html
git commit -am "Automatic documentation for version $npm_package_version"
git checkout master
git stash pop
browserify ./lib/async-node-events.js | uglifyjs > ./lib/async-node-events.min.js
git commit -am "Automatic minification for version $npm_package_version"
git tag $npm_package_version
git push
git push --tags
