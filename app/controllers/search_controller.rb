# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    people1 = Person.where('first_name ILIKE ?', "%#{search_params[:query]}%")
    people2 = Person.where('last_name ILIKE ?', "%#{search_params[:query]}%")
    companies = Company.where('name ILIKE ?', "%#{search_params[:query]}%")

    @results = Array(people1.to_a + people2.to_a + companies.to_a)
    @results_paginated = Kaminari.paginate_array(@results).page(params[:page])
  end

  private

  def search_params
    params.permit(:query)
  end
end
