#!/bin/bash
git clone https://github.com/glogiotatidis/planet.mozillareps.org.git
git config user.email "planetupdate@mozillareps.org"
git config user.name "planet-update-bot"
git remote add origin-rw https://${GITHUB_AUTH_TOKEN}@github.com/glogiotatidis/planet.mozillareps.org.git

docker run \
       -v `pwd`/planet.mozillareps.org/docs:/data/output \
       -v ~/cache:/data/cache \
       giorgos/planet-mozillareps-org-builder

git add -f --all docs/
git commit -m "Site update"

# Push only if there are commit changes.
if [[ $? == 0 ]];
then
    git push origin-rw master 2> /dev/null
fi
