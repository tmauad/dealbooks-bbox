# frozen_string_literal: true

class CreateMarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :markets do |t|
      t.string :name, null: false, index: true

      t.timestamps null: false
    end
  end
end
