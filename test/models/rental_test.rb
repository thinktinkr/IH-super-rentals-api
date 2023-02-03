# frozen_string_literal: true

require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  # rubocop:disable Metrics/MethodLength
  def setup
    @params = {
      id: 'ten',
      title: 'Ten',
      owner: 'Owner',
      city: 'City',
      latitude: 1.2345,
      longitude: -1.2345,
      category: 'Apartment',
      bedrooms: 2,
      image: 'url_to_image.jpg',
      description: 'text description here'
    }
    @rental = Rental.new(@params)
  end
  # rubocop:enable Metrics/MethodLength

  test 'valid minimal Rental' do
    rental = Rental.new(
      id: @params[:id],
      title: @params[:title],
      category: @params[:category],
      bedrooms: @params[:bedrooms],
      latitude: @params[:latitude],
      longitude: @params[:longitude]
    )
    assert rental.valid?
  end

  test 'valid full Rental' do
    assert @rental.valid?
  end

  test 'Rental validations' do
    assert_not Rental.new(@params.merge({ id: nil })).valid?,
               'Rental with no id should be invalid'
    assert_not Rental.new(@params.merge({ title: nil })).valid?,
               'Rental with no title should be invalid'
    assert_not Rental.new(@params.merge({ category: nil })).valid?,
               'Rental with no category should be invalid'
    assert_not Rental.new(@params.merge({ bedrooms: nil })).valid?,
               'Rental with no bedrooms should be invalid'
    assert_not Rental.new(@params.merge({ latitude: nil })).valid?,
               'Rental with no latitude should be invalid'
    assert_not Rental.new(@params.merge({ longitude: nil })).valid?,
               'Rental with no longitude should be invalid'
  end

  test 'Rental creation does not change data' do
    assert @rental.id == @params[:id]
    assert @rental.title == @params[:title]
    assert @rental.owner == @params[:owner]
    assert @rental.city == @params[:city]
    assert @rental.latitude == @params[:latitude]
    assert @rental.longitude == @params[:longitude]
    assert @rental.category == @params[:category]
    assert @rental.image == @params[:image]
    assert @rental.description == @params[:description]
  end
end
