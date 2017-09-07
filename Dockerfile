FROM python:2

WORKDIR /data
RUN pip install requests Django==1.2.3

ADD https://github.com/rubys/venus/archive/master.tar.gz /tmp/venus.tar.gz
ADD https://github.com/glogiotatidis/remo-planet-theme/archive/master.tar.gz /tmp/theme.tar.gz
ADD https://raw.githubusercontent.com/glogiotatidis/ReMo-Planet-AutoFeed/master/feed_address_generator.py .

RUN tar xf  /tmp/venus.tar.gz --strip-components 1
# now how cool is that?
RUN tar xf /tmp/theme.tar.gz  -C themes/ --transform=s/remo-planet-theme-master/remo-planet-theme/

COPY filter_categories.py /data/filters/
COPY planet_config.ini /data/
COPY entrypoint.sh .

CMD ./entrypoint.sh
