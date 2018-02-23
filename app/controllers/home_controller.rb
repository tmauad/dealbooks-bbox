# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @deals_count = Deal.all.count
    @companies_count = Company.all.count
    @investors_count = Investor.all.count
    @people_count = Person.all.count
  end
end
