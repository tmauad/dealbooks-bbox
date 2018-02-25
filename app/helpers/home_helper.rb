# frozen_string_literal: true

module HomeHelper
  include ActionView::Helpers::NumberHelper

  def latest_updates
    Deal.last(7).map do |deal|
      description = "#{deal.company.name} raised " \
        "#{number_to_currency(deal.amount, unit: deal.amount_currency)} " \
        "from #{deal.investors.map(&:name).join(', ')}"

      { description: description, date: deal.close_date }
    end
  end
end
