# frozen_string_literal: true

describe Localizable do
  subject(:localizable) { build(:localizable) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:localizable) }
    it { is_expected.to validate_presence_of(:localizable_type) }
    it { is_expected.to validate_presence_of(:location) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:localizable) }
    it { is_expected.to belong_to(:location) }
  end
end
