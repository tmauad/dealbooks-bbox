# frozen_string_literal: true

## COMPANIES
company1 = FactoryBot.create(:company)
location1 = FactoryBot.create(:location)
_localizable = FactoryBot.create(
  :localizable, localizable: company1, location: location1
)
_deal1 = FactoryBot.create(:deal, company: company1)
_deal2 = FactoryBot.create(:deal, company: company1)
_company_market1 = FactoryBot.create(:company_market, company: company1)
_company_market2 = FactoryBot.create(:company_market, company: company1)

company2 = FactoryBot.create(:company)
location2 = FactoryBot.create(:location)
_localizable = FactoryBot.create(
  :localizable, localizable: company2, location: location2
)
_deal3 = FactoryBot.create(:deal, company: company2)
_deal4 = FactoryBot.create(:deal, company: company2)
_company_market3 = FactoryBot.create(:company_market, company: company2)
_company_market4 = FactoryBot.create(:company_market, company: company2)

## PEOPLE
person1 = FactoryBot.create(:person)
_person_company1 = FactoryBot.create(
  :person_company, person: person1, company: company1
)
_person_company_latest = FactoryBot.create(
  :person_company,
  person: person1,
  company: company1,
  started_at: 2.years.ago.to_date,
  ended_at: nil
)
investor = FactoryBot.create(:investor, investable: person1)

deal1 = FactoryBot.create(:deal)
_deal_investor = FactoryBot.create(
  :deal_investor, deal: deal1, investor: investor
)

deal2 = FactoryBot.create(:deal)
_deal_investor = FactoryBot.create(
  :deal_investor, deal: deal2, investor: investor
)

deal3 = FactoryBot.create(:deal)
_deal_investor = FactoryBot.create(
  :deal_investor, deal: deal3, investor: investor
)

deal4 = FactoryBot.create(:deal)
_deal_investor = FactoryBot.create(
  :deal_investor, deal: deal4, investor: investor
)

FactoryBot.create(:deal_investor, deal: deal1, investor: investor)

_localizable = FactoryBot.create(
  :localizable, localizable: person1, location: location1
)
