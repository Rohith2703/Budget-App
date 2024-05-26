# Use the official Ruby image as a base image
FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . /myapp

# Precompile assets (optional, if you have assets)
# RUN bundle exec rake assets:precompile

# Expose port 3000 to the Docker host
EXPOSE 3001

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]

