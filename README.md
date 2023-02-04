# Super Rentals API

This is a Ruby on Rails API intended to back the Ember tutorial https://guides.emberjs.com/release/tutorial/part-1/ with minimal adjustment.

## Dependencies

   - Built using Ruby 3.2.0, Rails 7.0.4.2, Bundler 2.4.1 -- others may work too.
   - Database is stock SQLite3

## Making It Go

0. Install Docker Desktop if you don't have it already

      https://www.docker.com/products/docker-desktop/

1. Create the container from the latest ruby image
      ```
      docker run -d -it -p 8010:8010 --name IH_super_rental_api ruby /bin/bash
      docker exec -it IH_super_rental_api /bin/bash
      ```

2. Update the container, install SQLite3, review versions
      ```
      apt update
      apt install sqlite3 rails
      ruby --version ; sqlite3 --version ; rails --version
      ```

3. Clone repo, build, test, and start API
      ```
      git clone https://github.com/thinktinkr/IH-super-rentals-api.git
      cd IH-super-rentals-api
      bundle install
      bundle exec rake db:migrate
      bundle exec rails test
      bundle exec rake db:add_test_data
      bundle exec rails s
      ```

### Notes

   * I flattened the Ember data model such that latitude and longitude are plain attributes of the Rental for simplicity and because I didn't see a compelling reason for a geographic Location to have many Rentals.
