# frozen_string_literal: true

json.extract! rental, :id, :text_id, :title, :owner, :city, :latitude, :longitude, :category, :bedrooms, :image,
              :description, :created_at, :updated_at
json.url rental_url(rental, format: :json)
