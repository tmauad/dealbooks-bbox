# frozen_string_literal: true

describe DealsController do
  describe '#index' do
    subject(:index) { get :index }

    it 'returns deals' do
      deal1 = create(:deal, close_date: 1.year.ago.to_date)
      deal2 = create(:deal, close_date: 2.years.ago.to_date)

      index

      expect(assigns(:deals)).to eq([deal2, deal1])
    end

    it 'returns paginated' do
      11.times { create(:deal) }

      index

      expect(assigns(:deals_paginated).count).to eq(10)
    end
  end

  describe '#new' do
    subject(:new) { get :new }

    it 'returns a new deal' do
      sign_in create(:user)

      company = create(:company)
      investor = create(:investor)

      new

      expect(assigns(:companies)).to eq([company])
      expect(assigns(:investors)).to eq([investor])

      expect(assigns(:deal)).to be_a(Deal)
      expect(assigns(:deal)).to_not be_persisted
    end
  end

  describe '#create' do
    let(:investor) { create(:investor) }
    let(:company) { create(:company) }

    let(:params) do
      attributes_for(:deal).merge(
        company_id: company.id,
        deal_investors_attributes: { investor_id: investor.id }
      )
    end

    subject(:create_deal) { post :create, params: { deal: params } }

    it 'creates a deal' do
      sign_in create(:user)

      expect { create_deal }.to change {
        [Deal.all.count, DealInvestor.all.count]
      }.from([0, 0]).to([1, 1])
    end
  end
end
