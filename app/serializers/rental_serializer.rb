# frozen_string_literal: true

class RentalSerializer
  include JSONAPI::Serializer
  link :self, :self_link
  attributes :id, :title, :owner, :city, :latitude, :longitude, :category, :bedrooms, :image, :description,
             :created_at, :updated_at
end
