# frozen_string_literal: true

class CreateInvestors < ActiveRecord::Migration[5.1]
  def change
    create_table :investors do |t|
      t.references :investable, polymorphic: true, null: false, index: true

      t.string :status, default: 'active', null: false, index: true
      t.string :category
      t.string :stage

      t.timestamps null: false
    end
  end
end
