# frozen_string_literal: true

describe PersonCompany do
  subject(:person_company) { build(:person_company) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:person_id) }
    it { is_expected.to validate_presence_of(:company_id) }
    it { is_expected.to validate_presence_of(:job_title) }

    describe 'started_at' do
      it 'is a valid started_at, then returns valid' do
        person_company.started_at = Time.zone.today

        is_expected.to be_valid
      end

      it 'is not a valid started_at, then returns invalid' do
        person_company.started_at = 'i-am-not-a-date'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        person_company.started_at = nil

        is_expected.to be_valid
      end
    end

    describe 'ended_at' do
      it 'is a valid ended_at, then returns valid' do
        person_company.ended_at = Time.zone.today

        is_expected.to be_valid
      end

      it 'is not a valid ended_at, then returns invalid' do
        person_company.ended_at = 'i-am-not-a-date'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        person_company.ended_at = nil

        is_expected.to be_valid
      end
    end
  end

  describe 'relations' do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:company) }
  end
end
