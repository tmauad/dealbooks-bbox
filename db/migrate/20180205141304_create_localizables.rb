# frozen_string_literal: true

class CreateLocalizables < ActiveRecord::Migration[5.1]
  def change
    create_table :localizables do |t|
      t.references :localizable, polymorphic: true, index: true, null: false

      t.references :location, null: false, index: true

      t.timestamps null: false
    end
  end
end
