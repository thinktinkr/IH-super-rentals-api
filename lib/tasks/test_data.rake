# frozen_string_literal: true

# require_relative '../../app/models/rental'
# require 'app/models/rental'
# require 'app/models/rental.rb'
# require 'rental'
# require 'rental.rb'
# require Rental
# Rails.application.eager_load!

namespace :db do
  desc 'Add test data'
  task add_test_data: [:environment] do
    warn 'Adding four test Rentals...'
    rentals = Rental.create([
                              {
                                id: 'downtown-charm',
                                title: 'Downtown Charm',
                                owner: 'Violet Beauregarde',
                                city: 'Portland',
                                latitude: 45.5175,
                                longitude: -122.6801,
                                category: 'Apartment',
                                bedrooms: 3,
                                image: 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Wheeldon_Apartment_Building_-_Portland_Oregon.jpg',
                                description: 'Convenience is at your doorstep with this charming downtown rental. Great restaurants and active night life are within a few feet.'
                              },
                              {
                                id: 'grand-old-mansion',
                                title: 'Grand Old Mansion',
                                owner: 'Veruca Salt',
                                city: 'San Francisco',
                                latitude: 37.7749,
                                longitude: -122.4194,
                                category: 'Estate',
                                bedrooms: 15,
                                image: 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Crane_estate_(5).jpg',
                                description: 'This grand old mansion sits on over 100 acres of rolling hills and dense redwood forests.'
                              },
                              {
                                id: 'urban-living',
                                title: 'Urban Living',
                                owner: 'Mike Teavee',
                                city: 'Seattle',
                                latitude: 47.6062,
                                longitude: -122.3321,
                                category: 'Condo',
                                bedrooms: 1,
                                image: 'https://upload.wikimedia.org/wikipedia/commons/2/20/Seattle_-_Barnes_and_Bell_Buildings.jpg',
                                description: 'A commuters dream. This rental is within walking distance of 2 bus stops and the Metro.'
                              },
                              {
                                id: 'historic-german-home',
                                title: 'Historic German Home',
                                owner: 'Augustus Gloop',
                                city: 'Düsselheim',
                                latitude: 51.233333,
                                longitude: 6.783333,
                                category: 'House',
                                bedrooms: 5,
                                image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/D%C3%BCsseldorf_Grupello.jpg/2560px-D%C3%BCsseldorf_Grupello.jpg',
                                description: 'A historic German home. This rental was originally built in 1706 and has all the luxuries you would expect from that century.'
                              }
                            ])

    raise 'Failed to create four test Rentals' unless Rental.all.count == 4

    warn 'Complete.'
  end

  desc 'Remove test data'
  task remove_test_data: [:environment] do
    warn 'Removing four test Rentals...'
    Rental.delete('downtown-charm') if Rental.find('downtown-charm')
    Rental.delete('grand-old-mansion') if Rental.find('grand-old-mansion')
    Rental.delete('urban-living') if Rental.find('urban-living')
    Rental.delete('historic-german-home') if Rental.find('historic-german-home')
    warn 'Complete.'
  end
end
