FROM solarce/trusty-ruby

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# JS runtime
RUN apt-get install -y nodejs

# Capybara webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# Image deps
RUN apt-get install -y liblcms2-dev libtiff-dev librsvg2-bin libmagickcore-dev libmagickwand-dev ImageMagick

RUN mkdir /weaveup

# Run Bundle install in a cache efficient way
WORKDIR /weaveup
ADD weaveup/Gemfile* /weaveup/
RUN bundle install

# Add rails app
ADD weaveup/ /weaveup
