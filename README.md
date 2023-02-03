# Super Rentals API

This is a Ruby on Rails API intended to back the Ember tutorial https://guides.emberjs.com/release/tutorial/part-1/ with minimal adjustment.

## Dependencies

   - Built using Ruby 3.2.0, Rails 7.0.4.2, Bundler 2.4.1 -- others may work too.
   - Database is stock SQLite3

## Getting Started

1. Prepare a place for this for this project, I prefer using Docker containers.
2. `git clone https://github.com/thinktinkr/IH-super-rentals-api.git`
3. `cd IH-super-rentals-api`
4. `bundle install`
5. `bundle exec rake db:migrate`
6. `bundle exec rails test`
7. `bundle exec rake db:add_test_data`
8. `bundle exec rails s`

### Notes

   * I flattened the Ember data model such that latitude and longitude are plain attributes of the Rental for simplicity and because I didn't see a compelling reason for a geographic Location to have many Rentals.
