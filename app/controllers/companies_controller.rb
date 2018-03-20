# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = SearchService.new(Company, filter_params).fetch.order(:name)

    @companies_paginated = @companies.page(params[:page])
  end

  def show
    @company = Company.find_by!(permalink: params[:id])

    @investors = @company.deals.flat_map(&:investors).uniq
  end

  def new
    @company = Company.new

    @markets = Market.all
  end

  def create
    @markets = Market.all

    @company = Company.new(company_params)

    if @company.save
      create_company_markets

      redirect_to(companies_path, notice: 'Successfully saved')
    else
      render :new
    end
  end

  def edit
    @company = Company.find_by!(permalink: params[:id])
  end

  def update
    @company = Company.find_by!(permalink: params[:id])

    if @company.update(company_params)
      redirect_to companies_path, notice: 'Successfully updated'
    else
      render :edit
    end
  end

  private

  COMPANY_PARAMS = %i[
    name employees_count born_date description email website_url
    facebook_url linkedin_url twitter_url google_plus_url phone_number
  ].freeze
  private_constant :COMPANY_PARAMS

  def alloweds
    params.require(:company).permit(
      *COMPANY_PARAMS,
      locations_attributes: %i[city country],
      company_markets_attributes: { market_id: [] }
    )
  end

  def filter_params
    return {} unless params[:filter]

    params.require(:filter).permit(:fields, :operators, :values)
  end

  def create_company_markets
    company_markets_attributes = alloweds[:company_markets_attributes]

    return unless company_markets_attributes

    company_markets_attributes[:market_id].delete_if(&:blank?)

    company_markets_attributes[:market_id].map do |market_id|
      @company.company_markets.create!(market_id: market_id)
    end
  end

  def company_params
    @company_params ||=
      begin
        locations_attributes = alloweds[:locations_attributes]

        return allowed_company if locations_attributes.to_h.values.all?(&:empty?)

        allowed_company.merge({
          locations_attributes: [
            {
              city: locations_attributes[:city].presence,
              country: locations_attributes[:country].presence
            }
          ]
        })
      end
  end

  def allowed_company
    COMPANY_PARAMS.inject({}) do |acc, param|
      acc.merge(param => alloweds[param].presence)
    end
  end
end
