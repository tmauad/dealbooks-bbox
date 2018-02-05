# frozen_string_literal: true

describe InvestorMarket do
  subject(:investor_market) { build(:investor_market) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:investor_id) }
    it { is_expected.to validate_presence_of(:market_id) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:investor) }
    it { is_expected.to belong_to(:market) }
  end
end
