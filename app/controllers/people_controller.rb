# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    @people = SearchService.new(Person, filter_params).fetch

    @people_paginated = @people.page(params[:page])
  end

  def show
    @person = Person.find_by!(permalink: params[:id])

    @deals = Array(@person.investor.try(:deal_investors)).map(&:deal)
  end

  def new
    @companies = Company.all

    @person = Person.new
  end

  def create
    @companies = Company.all

    @person = Person.new(person_params)

    if @person.save
      redirect_to people_path, notice: 'Successfully saved'
    else
      render :new
    end
  end

  def edit
    @companies = Company.all

    @person = Person.find_by!(permalink: params[:id])
  end

  def update
    @companies = Company.all

    @person = Person.find_by!(permalink: params[:id])

    if @person.update(person_params)
      redirect_to people_path, notice: 'Successfully updated'
    else
      render :edit
    end
  end

  private

  PERSON_PARAMS = %i[
    first_name last_name description occupation born_date gender phone_number
    email website_url facebook_url twitter_url google_plus_url linkedin_url
  ].freeze
  private_constant :PERSON_PARAMS

  def alloweds
    params.require(:person).permit(
      *PERSON_PARAMS,
      person_companies_attributes: [:company_id],
      locations_attributes: %i[city country]
    )
  end

  def allowed_person
    PERSON_PARAMS.inject({}) do |acc, param|
      acc.merge(param => alloweds[param].presence)
    end
  end

  def filter_params
    return {} unless params[:filter]

    params.require(:filter).permit(:fields, :operators, :values)
  end

  def person_params
    @person_params ||= allowed_person
      .merge(locations_attributes)
      .merge(person_companies_attributes)
  end

  def locations_attributes
    locations_attributes = alloweds[:locations_attributes]

    return {} if locations_attributes.to_h.values.all?(&:empty?)

    {
      locations_attributes: [
        {
          city: locations_attributes[:city].presence,
          country: locations_attributes[:country].presence
        }
      ]
    }
  end

  def person_companies_attributes
    person_companies_attributes = alloweds[:person_companies_attributes]

    return {} if person_companies_attributes.to_h.values.all?(&:empty?)

    {
      person_companies_attributes: [
        {
          company_id: person_companies_attributes[:company_id].presence,
          job_title: alloweds[:occupation].presence
        }
      ]
    }
  end
end
