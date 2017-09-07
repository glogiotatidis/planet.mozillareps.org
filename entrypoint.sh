#!/bin/sh

python feed_address_generator.py >> planet_config.ini
python planet.py planet_config.ini
