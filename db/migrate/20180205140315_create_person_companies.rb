# frozen_string_literal: true

class CreatePersonCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :person_companies do |t|
      t.references :person, index: true, null: false
      t.references :company, index: true, null: false

      t.string :job_title, index: true, null: false

      t.date :started_at
      t.date :ended_at

      t.timestamps null: false
    end
  end
end
