# frozen_string_literal: true

describe Investor do
  subject(:investor) { build(:investor) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:investable_id) }
    it { is_expected.to validate_presence_of(:investable_type) }

    it do
      is_expected.to(
        validate_inclusion_of(:status).in_array(described_class::STATUSES)
      )
    end

    it do
      is_expected.to(
        validate_inclusion_of(:category).in_array(described_class::CATEGORIES)
      )
    end

    it do
      is_expected.to(
        validate_inclusion_of(:stage).in_array(described_class::STAGES)
      )
    end
  end

  describe 'relations' do
    it { is_expected.to belong_to(:investable) }
    it { is_expected.to have_many(:deal_investors) }
    it { is_expected.to have_many(:deals).through(:deal_investors) }
  end
end
