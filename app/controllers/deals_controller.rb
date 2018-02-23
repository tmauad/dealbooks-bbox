# frozen_string_literal: true

class DealsController < ApplicationController
  def index
    @deals = Deal.all.order(:close_date)
    @deals_paginated = @deals.page(params[:page])
  end

  def new
    @companies = Company.all
    @investors = Investor.all

    @deal = Deal.new
  end

  def create
    @companies = Company.all
    @investors = Investor.all

    @deal = Deal.new(deal_params)

    if @deal.save
      redirect_to deals_path, notice: 'Successfully saved'
    else
      render :new
    end
  end

  private

  DEAL_PARAMS = %i[
    close_date company_id category round amount_currency
    amount_cents pre_valuation_cents source_url
  ].freeze
  private_constant :DEAL_PARAMS

  def alloweds
    params.require(:deal).permit(
      *DEAL_PARAMS, deal_investors_attributes: [:investor_id]
    )
  end

  def deal_params
    @deal_params ||=
      begin
        allowed_deal.merge(
          deal_investors_attributes: [
            { investor_id: alloweds[:deal_investors_attributes][:investor_id] }
          ]
        )
      end
  end

  def allowed_deal
    DEAL_PARAMS.inject({}) do |acc, param|
      acc.merge(param => alloweds[param].presence)
    end
  end
end
