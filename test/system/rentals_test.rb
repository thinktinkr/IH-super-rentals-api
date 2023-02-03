# frozen_string_literal: true

require 'application_system_test_case'

class RentalsTest < ApplicationSystemTestCase
  setup do
    @rental = rentals(:one)
  end

  test 'visiting the index' do
    visit rentals_url
    assert_selector 'h1', text: 'Rentals'
  end

  test 'should create rental' do
    visit rentals_url
    click_on 'New rental'

    fill_in 'Bedrooms', with: @rental.bedrooms
    fill_in 'Category', with: @rental.category
    fill_in 'City', with: @rental.city
    fill_in 'Description', with: @rental.description
    fill_in 'Image', with: @rental.image
    fill_in 'Latitude', with: @rental.latitude
    fill_in 'Longitude', with: @rental.longitude
    fill_in 'Owner', with: @rental.owner
    fill_in 'Text', with: @rental.text_id
    fill_in 'Title', with: @rental.title
    click_on 'Create Rental'

    assert_text 'Rental was successfully created'
    click_on 'Back'
  end

  test 'should update Rental' do
    visit rental_url(@rental)
    click_on 'Edit this rental', match: :first

    fill_in 'Bedrooms', with: @rental.bedrooms
    fill_in 'Category', with: @rental.category
    fill_in 'City', with: @rental.city
    fill_in 'Description', with: @rental.description
    fill_in 'Image', with: @rental.image
    fill_in 'Latitude', with: @rental.latitude
    fill_in 'Longitude', with: @rental.longitude
    fill_in 'Owner', with: @rental.owner
    fill_in 'Text', with: @rental.text_id
    fill_in 'Title', with: @rental.title
    click_on 'Update Rental'

    assert_text 'Rental was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Rental' do
    visit rental_url(@rental)
    click_on 'Destroy this rental', match: :first

    assert_text 'Rental was successfully destroyed'
  end
end
