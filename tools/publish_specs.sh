#!/bin/bash

tox -e docs

if [[ -d "/tmp/gslb_specs" ]]; then
    echo "HERE - 1"
    pushd /tmp/gslb_specs/
    git reset --hard
    popd
else
    echo "HERE - 2"
    pushd /tmp/
    git clone git@github.com:gslb/gslb-specs.git
    cd /tmp/gslb-specs
    echo "HERE - 3"
    pwd
    git checkout -b gh-pages origin/gh-pages
    git pull origin
    cd ..
    echo "HERE - 4"
    pwd
    popd
fi

cp -r doc/build/html/* /tmp/gslb-specs/
echo "HERE - 5"
pushd /tmp/gslb-specs/
    echo "HERE - 6"
    #git add -A
    #git commit -a -m "Updated Specs"
    #git push origin gh-pages
    
popd