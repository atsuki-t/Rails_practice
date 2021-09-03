FROM ruby:2.7.3

COPY Gemfile /workspace/Gemfile
COPY Gemfile.lock /workspace/Gemfile.lock

WORKDIR /workspace

RUN gem install bundler -v "2.2.25"
RUN bundle install

ENTRYPOINT ["bash", "-c", "bundle exec rails db:create db:migrate db:seed && bundle exec rails server"]
