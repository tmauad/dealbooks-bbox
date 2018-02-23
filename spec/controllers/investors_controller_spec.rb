# frozen_string_literal: true

describe InvestorsController do
  describe '#index' do
    subject(:index) { get :index }

    it 'returns all investors' do
      investor1 = create(:investor)
      investor2 = create(:investor)

      index

      expect(assigns(:investors)).to eq([investor1, investor2])
    end

    it 'returns investors paginated' do
      11.times { create(:investor) }

      index

      expect(assigns(:investors_paginated).count).to eq(10)
    end
  end

  describe '#show' do
    let(:investor) { create(:investor, :company) }

    subject(:show) { get :show, params: { id: investor.investable.permalink } }

    it 'returns the investor company' do
      show

      expect(assigns(:investor)).to eq(investor)
    end

    context 'when is a person' do
      let(:investor) { create(:investor, :person) }

      it 'returns the investor person' do
        show

        expect(assigns(:investor)).to eq(investor)
      end
    end
  end

  describe '#new' do
    subject(:new) { get :new }

    it 'returns a new investor' do
      sign_in create(:user)

      new

      expect(assigns(:investor)).to be_an(Investor)
      expect(assigns(:investor)).to_not be_persisted
    end
  end

  describe '#create' do
    let(:investable) { create(:company) }

    let(:params) do
      attributes_for(:investor).merge(
        investable_id: "#{investable.class}-#{investable.id}"
      )
    end

    subject(:create_investor) { post :create, params: { investor: params } }

    it 'creates an investor' do
      sign_in create(:user)

      expect { create_investor }.to change { Investor.all.count }.from(0).to(1)
    end
  end
end
