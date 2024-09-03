FROM ruby:3.0

WORKDIR /srv/jekyll

# Install the correct Bundler version
RUN gem install bundler -v 2.5.17

# Install Jekyll
RUN gem install jekyll

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* ./

# Install dependencies
RUN bundle install

# Copy the rest of the site into the container
COPY . .

# Expose port 4000 for Jekyll
EXPOSE 4000

# Command to run Jekyll
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
