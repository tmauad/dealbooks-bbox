# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order(:name)
    @companies_paginated = @companies.page(params[:page])

    respond_to do |format|
      format.html
      format.xls
    end
  end

  def show
    @company = Company.find_by!(permalink: params[:id])

    @investors = @company.deals.flat_map(&:investors).uniq
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
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
      *COMPANY_PARAMS, locations_attributes: %i[city region country]
    )
  end

  def company_params
    @company_params ||=
      begin
        locations_attributes = alloweds[:locations_attributes]

        return allowed_company if locations_attributes.to_h.values.all?(&:empty?)

        allowed_company.merge(
          locations_attributes: [
            {
              city: locations_attributes[:city].presence,
              region: locations_attributes[:region].presence,
              country: locations_attributes[:country].presence
            }
          ]
        )
      end
  end

  def allowed_company
    COMPANY_PARAMS.inject({}) do |acc, param|
      acc.merge(param => alloweds[param].presence)
    end
  end
end
