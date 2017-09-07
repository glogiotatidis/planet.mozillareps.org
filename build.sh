#!/bin/bash

docker run giorgos/planet-mozillareps-org-builder
docker cp $(docker ps -a -q | head -n 1):/data/output .

git clone https://github.com/glogiotatidis/planet.mozillareps.org.git
rsync --recursive --delete ./output/ planet.mozillareps.org/docs/

pushd planet.mozillareps.org/

git config user.email "planetupdate@mozillareps.org"
git config user.name "planet-update-bot"
git remote add origin-rw https://${GITHUB_AUTH_TOKEN}@github.com/glogiotatidis/planet.mozillareps.org.git
git add -f --all docs/
git commit -m "Site update"

# Push only if there are commit changes.
if [[ $? == 0 ]];
then
    git push origin-rw master 2> /dev/null
fi
