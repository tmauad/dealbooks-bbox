# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    people = Person.where('name ILIKE ?', "%#{params[:query]}%")
    companies = Company.where('name ILIKE ?', "%#{params[:query]}%")

    @results = Array(people.to_a + companies.to_a)
  end
end
