# frozen_string_literal: true

class Rental < ApplicationRecord
  validates :id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :category, inclusion: {
    in: %w[Apartment Estate Condo House],
    message: I18n.t('tests.category_invalid')
  }
  validates :bedrooms, comparison: {
    greater_than_or_equal_to: 0,
    message: I18n.t('tests.bedrooms_invalid')
  }
  validates :latitude, comparison: {
    greater_than_or_equal_to: -90,
    less_than_or_equal_to: 90,
    message: I18n.t('tests.latitude_invalid')
  }
  validates :longitude, comparison: {
    greater_than_or_equal_to: -360,
    less_than_or_equal_to: 360,
    message: I18n.t('tests.longitude_invalid')
  }

  def self_link
    "http://localhost:8010/#{self.class.to_s.downcase}s/#{id}.json"
  end
end
