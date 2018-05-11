# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false, index: true
      t.string :permalink, null: false, index: true

      t.text :description
      t.integer :employees_count
      t.date :born_date
      t.string :phone_number
      t.string :email

      t.string :website_url
      t.string :linkedin_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :google_plus_url

      t.string :status, null: false, index: true, default: 'active'

      t.timestamps null: false
    end
  end
end
