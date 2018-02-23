# frozen_string_literal: true

module PeopleHelper
  def latest_company(person, person_companies = person.person_companies)
    current_person_company = person_companies.detect(&:current?)

    if current_person_company
      current_person_company.company.name
    elsif person_companies.last
      person_companies.last.company.name
    else
      'Unknown'
    end
  end

  def investor_category(person)
    return unless person.investor

    person.investor.category
  end
end
