# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    args = ['name ILIKE ?', "%#{search_params[:query]}%"]
    people = Person.where(*args)
    companies = Company.where(*args)

    @results = Array(people.to_a + companies.to_a)
    @results_paginated = Kaminari.paginate_array(@results).page(params[:page])
  end

  private

  def search_params
    params.permit(:query)
  end
end
