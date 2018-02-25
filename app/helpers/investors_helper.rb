# frozen_string_literal: true

module InvestorsHelper
  def possible_new_investors
    people = Person.all.collect do |p|
      ["#{p.name}- Person", "Person-#{p.id}"]
    end

    companies = Company.all.collect do |p|
      ["#{p.name}- Company", "Company-#{p.id}"]
    end

    Array(people + companies)
  end
end
