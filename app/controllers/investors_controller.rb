# frozen_string_literal: true

class InvestorsController < ApplicationController
  def index
    @investors = Investor.all

    @investors_paginated = @investors.page(params[:page])
  end

  def show
    company_investor = Company.find_by(permalink: params[:id]).try(:investor)
    person_investor = Person.find_by(permalink: params[:id]).try(:investor)

    @investor = company_investor || person_investor
  end

  def new
    @investor = Investor.new
  end

  def create
    @investor = Investor.new(investor_params)

    if @investor.save
      redirect_to investors_path, notice: 'Successfully saved'
    else
      render :new
    end
  end

  private

  def alloweds
    params.require(:investor).permit(:investable_id, :status, :category, :stage)
  end

  def investor_params
    investable_type, investable_id = alloweds[:investable_id].split('-')

    {
      investable_id: investable_id,
      investable_type: investable_type,
      status: alloweds[:status].presence,
      category: alloweds[:category].presence,
      stage: alloweds[:stage].presence
    }
  end
end
