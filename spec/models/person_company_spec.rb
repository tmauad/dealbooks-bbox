# frozen_string_literal: true

describe PersonCompany do
  subject(:person_company) { build(:person_company) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:person) }
    it { is_expected.to validate_presence_of(:company) }
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

  describe 'current?' do
    let(:person_company) do
      build(:person_company, started_at: 10.years.ago.to_date, ended_at: nil)
    end

    subject(:current?) { person_company.current? }

    it 'returns true for the current job' do
      is_expected.to eq(true)
    end

    context 'when is not the current job' do
      let(:person_company) do
        build(
          :person_company,
          started_at: 10.years.ago.to_date,
          ended_at: 5.years.ago.to_date
        )
      end

      it 'returns false' do
        is_expected.to eq(false)
      end
    end
  end
end
