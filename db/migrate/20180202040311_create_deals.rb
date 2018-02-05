# frozen_string_literal: true

class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.date :close_date, null: false
      t.references :company, null: false, index: true

      t.string :status, null: false, index: true, default: 'unverified'

      t.string :category, null: false, index: true
      t.string :round, index: true

      t.string :amount_currency
      t.integer :amount_cents

      t.string :pre_valuation_currency
      t.integer :pre_valuation_cents

      t.string :source_url

      t.timestamps null: false
    end
  end
end
