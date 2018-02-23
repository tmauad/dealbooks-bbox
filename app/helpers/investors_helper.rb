# frozen_string_literal: true

module InvestorsHelper
  def possible_new_investors
    # TODO: filter here, all that already are investors
    people = Person.all.collect { |p| ["#{p.name}- Person", "Person-#{p.id}"] }
    companies = Company.all.collect { |p| ["#{p.name}- Company", "Company-#{p.id}"] }

    Array(people + companies)
  end
end
