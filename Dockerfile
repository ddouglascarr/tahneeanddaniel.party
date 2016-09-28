FROM jekyll/jekyll

ENV PROJECT_SRC_DIR /opt/wedding-site-src
ENV PROJECT_BUILD_DIR /opt/wedding-site/_site
ENV PROJECT_GEMS_DIR /opt/wedding-site-gems
CMD echo "This container will exit"

RUN mkdir -p $PROJECT_BUILD_DIR && \
  chown jekyll $PROJECT_BUILD_DIR
ADD ./Gemfile ${PROJECT_GEMS_DIR}/Gemfile
WORKDIR $PROJECT_GEMS_DIR
RUN bundle install

ADD . $PROJECT_SRC_DIR
RUN jekyll build --source $PROJECT_SRC_DIR --destination $PROJECT_BUILD_DIR
