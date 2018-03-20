# frozen_string_literal: true

describe PeopleController do
  describe '#index' do
    subject(:index) { get :index }

    it 'returns people' do
      person = create(:person)

      index

      expect(assigns(:people)).to eq([person])
    end

    it 'returns people paginated' do
      11.times { create(:person) }

      index

      expect(assigns(:people_paginated).count).to eq(10)
    end
  end

  describe '#show' do
    let(:person) { create(:person) }

    subject(:show) { get :show, params: { id: person.permalink } }

    it 'returns a person' do
      show

      expect(assigns(:person)).to eq(person)
    end

    it 'returns all deals related to this person' do
      investor = create(:investor, investable: person)

      deal1 = create(:deal)
      deal2 = create(:deal)

      create(:deal_investor, investor: investor, deal: deal1)
      create(:deal_investor, investor: investor, deal: deal2)

      show

      expect(assigns(:deals)).to eq([deal1, deal2])
    end
  end

  describe '#new' do
    subject(:new) { get :new }

    it 'returns a new person' do
      sign_in create(:user)

      new

      expect(assigns(:person)).to be_a(Person)
      expect(assigns(:person)).to_not be_persisted
    end

    it 'returns all companies' do
      sign_in create(:user)

      company1 = create(:company)
      company2 = create(:company)

      new

      expect(assigns(:companies)).to eq([company1, company2])
    end
  end

  describe '#create' do
    let(:company) { create(:company) }

    let(:params) do
      attributes_for(:person).merge(
        locations_attributes: { city: 'City', country: 'Country' }
      ).merge(
        person_companies_attributes: {
          company_id: company.id
        }
      )
    end

    subject(:create_person) { post :create, params: { person: params } }

    it 'creates a company' do
      sign_in create(:user)

      expect { create_person }.to change {
        [Person.all.count, Location.all.count, PersonCompany.all.count]
      }.from([0, 0, 0]).to([1, 1, 1])
    end
  end
end
