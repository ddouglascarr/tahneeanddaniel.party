FROM jekyll/jekyll

ENV PROJECT_SRC_DIR /opt/wedding-site-src
ENV PROJECT_BUILD_DIR /opt/wedding-site/_site
ENV PROJECT_GEMS_DIR /opt/wedding-site-gems

# Exit container at boot
ENTRYPOINT []
CMD echo "This container should exit when run"

RUN mkdir -p $PROJECT_BUILD_DIR && \
  chown jekyll $PROJECT_BUILD_DIR && \
  mkdir -p $PROJECT_GEMS_DIR && \
  chown jekyll $PROJECT_GEMS_DIR

ADD ./Gemfile ${PROJECT_GEMS_DIR}/Gemfile
WORKDIR $PROJECT_GEMS_DIR
RUN sudo -u jekyll /bin/bash -c 'bundle install'

ADD . $PROJECT_SRC_DIR
RUN jekyll build --source $PROJECT_SRC_DIR --destination $PROJECT_BUILD_DIR
