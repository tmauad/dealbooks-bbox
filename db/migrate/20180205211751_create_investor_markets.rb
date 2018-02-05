# frozen_string_literal: true

class CreateInvestorMarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :investor_markets do |t|
      t.references :investor, null: false, index: true
      t.references :market, null: false, index: true

      t.timestamps null: false
    end
  end
end
