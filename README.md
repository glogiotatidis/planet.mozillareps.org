# Mozilla Reps Planet

This repository contains the builder and the website for
http://planet.mozilla.org.

## Operation

A daily [Travis-CI](http://travis-ci.org/) build downloads all the Reps feeds
from the ReMo API and builds a configuration
for [Venus](https://github.com/rubys/venus). The build then runs the later to
build the website. Any updates to the planet are commited to the gh-pages branch
and pushed to GitHub. The website runs
under [GitHub Pages](https://pages.github.com/) and listens at
http://planet.mozillareps.org


## See also

 * [Script to auto-create venus planet software configuration from reps.mozilla.org API](https://github.com/glogiotatidis/ReMo-Planet-AutoFeed/)
 * [Planet theme](https://github.com/glogiotatidis/remo-planet-theme)
 * [Builder Docker Image](https://hub.docker.com/r/giorgos/planet-mozillareps-org-builder/)
