FROM ruby:2.4

# Create app directory
WORKDIR /usr/src/app

# Install nodejs
# NOTE: We need a more recent version compared to the 
# standard, supported Debian package version...
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN chmod +x nodesource_setup.sh
RUN ./nodesource_setup.sh
RUN apt-get install -y nodejs build-essential
RUN rm nodesource_setup.sh

# Bundle install...
COPY todo-api/Gemfile todo-api/Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Expose the rails development port
EXPOSE 3000

# Start the rails server on container startup
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
