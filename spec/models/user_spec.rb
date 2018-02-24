# frozen_string_literal: true

describe User do
  subject(:user) { build(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it do
      is_expected.to(
        validate_inclusion_of(:role).in_array(described_class::ROLES)
      )
    end
  end
end
