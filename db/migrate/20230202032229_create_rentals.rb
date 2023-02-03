# frozen_string_literal: true

class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals, id: false do |t|
      t.string :id, primary_key: true
      t.string :title
      t.string :owner
      t.string :city
      t.float :latitude
      t.float :longitude
      t.string :category
      t.integer :bedrooms
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
