# frozen_string_literal: true

describe CompaniesController do
  describe '#index' do
    subject(:index) { get :index }

    it 'returns companies ordered' do
      company1 = create(:company, name: 'b')
      company2 = create(:company, name: 'a')

      index

      expect(assigns(:companies)).to eq([company2, company1])
    end

    it 'returns paginated companies' do
      20.times { create(:company) }

      index

      expect(assigns(:companies_paginated).count).to eq(10)
    end
  end

  describe '#show' do
    let(:company) { create(:company) }

    subject(:show) { get :show, params: { id: company.permalink } }

    it 'returns the company' do
      show

      expect(assigns(:company)).to eq(company)
    end
  end

  describe '#new' do
    subject(:new) { get :new }

    it 'returns a new company' do
      sign_in create(:user)

      new

      expect(assigns(:company)).to be_a(Company)
      expect(assigns(:company)).to_not be_persisted
    end
  end

  describe '#create' do
    let(:params) do
      attributes_for(:company).merge(
        locations_attributes: {
          city: 'City', region: 'Region', country: 'Country'
        }
      )
    end

    subject(:create_company) { post :create, params: { company: params } }

    it 'creates a company' do
      sign_in create(:user)

      expect { create_company }.to change {
        [Company.all.count, Location.all.count]
      }.from([0, 0]).to([1, 1])
    end
  end
end
