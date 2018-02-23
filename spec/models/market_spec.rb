# frozen_string_literal: true

describe Market do
  subject(:market) { build(:market) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:company_markets) }
  end
end
