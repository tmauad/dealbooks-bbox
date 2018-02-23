# frozen_string_literal: true

describe HomeController do
  describe '#index' do
    subject(:index) { get :index }

    it do
      index

      expect(assigns(:deals_count)).to eq(0)
      expect(assigns(:companies_count)).to eq(0)
      expect(assigns(:investors_count)).to eq(0)
      expect(assigns(:people_count)).to eq(0)
    end
  end
end
