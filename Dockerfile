FROM jekyll/jekyll
RUN gem install bundle jekyll
ADD . /opt/wedding-site
WORKDIR /opt/wedding-site
RUN bundle install
RUN mkdir _site && chown jekyll _site && jekyll build
