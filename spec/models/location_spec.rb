# frozen_string_literal: true

describe Location do
  subject(:location) { build(:location) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:region) }
    it { is_expected.to validate_presence_of(:city) }
  end
end
