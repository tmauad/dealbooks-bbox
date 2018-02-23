# frozen_string_literal: true

describe Deal do
  subject(:deal) { build(:deal) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:close_date) }
    it { is_expected.to validate_presence_of(:company_id) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:category) }

    describe 'close_date' do
      it 'is a valid close_date, then returns valid' do
        deal.close_date = Time.zone.today

        is_expected.to be_valid
      end

      it 'is a valid close_date, when is in the past' do
        deal.close_date = 10.days.ago.to_date

        is_expected.to be_valid
      end

      context 'when is not a valid date' do
        it 'is not a valid close_date, then returns invalid' do
          deal.close_date = 'i-am-not-a-date'

          is_expected.to_not be_valid
        end

        it 'is not a valid close_date because is in the future' do
          deal.close_date = 10.days.from_now.to_date

          is_expected.to_not be_valid
        end
      end
    end

    it do
      is_expected.to(
        validate_inclusion_of(:category).in_array(described_class::CATEGORIES)
      )
    end

    it do
      is_expected.to(
        validate_inclusion_of(:status).in_array(described_class::STATUSES)
      )
    end

    it do
      is_expected.to(
        validate_inclusion_of(:round)
          .in_array(described_class::ROUNDS)
          .allow_nil
      )
    end

    it do
      is_expected.to(
        validate_inclusion_of(:amount_currency)
          .in_array(described_class::CURRENCIES)
          .allow_nil
      )
    end

    it do
      is_expected.to(
        validate_numericality_of(:amount_cents).only_integer.allow_nil
      )
    end

    it do
      is_expected.to(
        validate_inclusion_of(:pre_valuation_currency)
          .in_array(described_class::CURRENCIES)
          .allow_nil
      )
    end

    it do
      is_expected.to(
        validate_numericality_of(:pre_valuation_cents)
          .only_integer
          .is_greater_than(0)
          .allow_nil
      )
    end

    describe 'source_url' do
      it 'is a valid source_url, then returns valid' do
        deal.source_url = 'https://fakenews.com'

        is_expected.to be_valid
      end

      it 'is not a valid source_url, then returns invalid' do
        deal.source_url = 'dealbook.xls'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        deal.source_url = nil

        is_expected.to be_valid
      end
    end
  end

  describe 'relations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:deal_investors).dependent(:destroy) }
    it { is_expected.to have_many(:investors).through(:deal_investors) }
  end

  describe '#amount' do
    let(:deal) { build(:deal, amount_cents: 100_00) }

    subject(:amount) { deal.amount }

    it 'returns the value' do
      is_expected.to eq(100.00)
    end

    context 'when theres no amount_cents' do
      let(:deal) { build(:deal, amount_cents: nil) }

      it 'returns nil' do
        is_expected.to eq(nil)
      end
    end
  end

  describe '#pre_valuation' do
    let(:deal) { build(:deal, pre_valuation_cents: 100_00) }

    subject(:pre_valuation) { deal.pre_valuation }

    it 'returns the value' do
      is_expected.to eq(100.00)
    end

    context 'when theres no pre_valuation_cents' do
      let(:deal) { build(:deal, pre_valuation_cents: nil) }

      it 'returns nil' do
        is_expected.to eq(nil)
      end
    end
  end
end
