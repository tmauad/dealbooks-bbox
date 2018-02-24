# frozen_string_literal: true

describe SearchController do
  describe '#index' do
    let(:query) { { query: 'ab' } }
    subject(:index) { get :index, params: query }

    it 'returns the query result' do
      person = create(:person, name: 'Abc')
      company = create(:company, name: 'aBcD')

      index

      expect(assigns(:results)).to eq([person, company])
    end
  end
end
