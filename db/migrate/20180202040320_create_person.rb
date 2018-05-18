# frozen_string_literal: true

class CreatePerson < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name, null: false, index: true
      t.string :last_name
      t.string :permalink, null: false, index: true
      t.text :description

      t.date :born_date
      t.string :gender
      t.string :phone_number
      t.string :occupation

      t.string :email
      t.string :website_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :google_plus_url
      t.string :linkedin_url

      t.timestamps null: false
    end
  end
end
