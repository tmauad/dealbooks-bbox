# frozen_string_literal: true

## USERS
_user = FactoryBot.create(
  :user,
  email: 'dealbook@dealbook.co',
  password: 'test1020',
  password_confirmation: 'test1020'
)

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

### Create all markets
FactoryBot.create(:market, name: 'Design')
FactoryBot.create(:market, name: 'Hardware')
FactoryBot.create(:market, name: 'Commerce and Shopping')
FactoryBot.create(:market, name: 'Education')
FactoryBot.create(:market, name: 'Sports')
FactoryBot.create(:market, name: 'Food and Beverage')
FactoryBot.create(:market, name: 'Advertising')
FactoryBot.create(:market, name: 'Sales and Marketing')
FactoryBot.create(:market, name: 'Software')
FactoryBot.create(:market, name: 'Media and Entertainment')
FactoryBot.create(:market, name: 'Transportation')
FactoryBot.create(:market, name: 'Financial Services')
FactoryBot.create(:market, name: 'Internet Services')
FactoryBot.create(:market, name: 'Messaging and Telecommunications')
FactoryBot.create(:market, name: 'Content and Publishing')
FactoryBot.create(:market, name: 'Health Care')
FactoryBot.create(:market, name: 'Science and Engineering')
FactoryBot.create(:market, name: 'Data and Analysis')
FactoryBot.create(:market, name: 'Information Technology')
FactoryBot.create(:market, name: 'Internet Services')
FactoryBot.create(:market, name: 'Real Estate')
FactoryBot.create(:market, name: 'Travel and Tourism')
FactoryBot.create(:market, name: 'Payments')
FactoryBot.create(:market, name: 'Privacy and Security')
FactoryBot.create(:market, name: 'Consumer Eletronics')
FactoryBot.create(:market, name: 'Consumer Goods')
FactoryBot.create(:market, name: 'Administrative Services')
FactoryBot.create(:market, name: 'Music and Audio')
