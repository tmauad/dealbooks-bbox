# frozen_string_literal: true

class InvestorsController < ApplicationController
  def index
    @investors = SearchService.new(Investor, filter_params).fetch

    @investors_paginated = @investors.page(params[:page])
  end

  def show
    company_investor = Company.find_by(permalink: params[:id]).try(:investor)
    person_investor = Person.find_by(permalink: params[:id]).try(:investor)

    @investor = company_investor || person_investor
  end

  private

  def filter_params
    return {} unless params[:filter]

    params.require(:filter).permit(:fields, :operators, :values)
  end
end
