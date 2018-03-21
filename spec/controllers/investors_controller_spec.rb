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
end
