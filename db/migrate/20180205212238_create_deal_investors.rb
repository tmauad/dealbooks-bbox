# frozen_string_literal: true

class CreateDealInvestors < ActiveRecord::Migration[5.1]
  def change
    create_table :deal_investors do |t|
      t.references :deal, null: false, index: true
      t.references :investor, null: false, index: true

      t.timestamps null: false
    end
  end
end
