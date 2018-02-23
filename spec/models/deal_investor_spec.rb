# frozen_string_literal: true

describe DealInvestor do
  subject(:deal_investor) { build(:deal_investor) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:deal) }
    it { is_expected.to validate_presence_of(:investor) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:deal) }
    it { is_expected.to belong_to(:investor) }
  end
end
