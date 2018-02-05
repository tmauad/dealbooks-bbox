# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :country, null: false, index: true
      t.string :region, null: false, index: true
      t.string :city, null: false, index: true

      t.timestamps null: false
    end
  end
end
