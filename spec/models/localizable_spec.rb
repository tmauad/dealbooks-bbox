# frozen_string_literal: true

describe Localizable do
  subject(:localizable) { build(:localizable) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:localizable_id) }
    it { is_expected.to validate_presence_of(:localizable_type) }
    it { is_expected.to validate_presence_of(:location_id) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:localizable) }
    it { is_expected.to belong_to(:location) }
  end
end
