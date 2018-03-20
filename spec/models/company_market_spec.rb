# frozen_string_literal: true

describe CompanyMarket do
  subject(:company_market) { build(:company_market) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:company) }
    it { is_expected.to validate_presence_of(:market) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to belong_to(:market) }
  end
end
