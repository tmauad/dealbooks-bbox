# frozen_string_literal: true

describe Company do
  subject(:company) { build(:company) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:permalink) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:status) }

    describe 'permalink' do
      it 'is a valid slug, then returns valid' do
        company.permalink = 'right-permalink'

        is_expected.to be_valid
      end

      it 'is not a valid permalink, then returns invalid' do
        company.permalink = 'wrong permalink'

        is_expected.not_to be_valid
        expect(company.errors[:permalink]).to eq(['is invalid'])
      end
    end

    it do
      is_expected.to(
        validate_inclusion_of(:status).in_array(described_class::STATUSES)
      )
    end

    it do
      is_expected.to validate_numericality_of(:employees_count).only_integer
    end

    describe 'born_date' do
      it 'is a valid born_date, then returns valid' do
        company.born_date = Time.zone.today

        is_expected.to be_valid
      end

      it 'is not a valid born_date, then returns invalid' do
        company.born_date = 'i-am-not-a-date'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        company.born_date = nil

        is_expected.to be_valid
      end
    end

    describe 'email' do
      it 'is a valid email, then returns valid' do
        company.email = 'myemail@gmail.com'

        is_expected.to be_valid
      end

      it 'is not a valid email, then returns invalid' do
        company.email = 'i-am-not-an-email'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        company.email = nil

        is_expected.to be_valid
      end
    end

    describe 'website_url' do
      it 'is a valid website_url, then returns valid' do
        company.website_url = 'https://dealbook.com'

        is_expected.to be_valid
      end

      it 'is not a valid website_url, then returns invalid' do
        company.website_url = 'dealbook.xls'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        company.website_url = nil

        is_expected.to be_valid
      end
    end

    describe 'linkedin_url' do
      it 'is a valid linkedin_url, then returns valid' do
        company.linkedin_url = 'https://linkedin.com/dealbook'

        is_expected.to be_valid
      end

      it 'is not a valid linkedin_url, then returns invalid' do
        company.linkedin_url = 'linkedin@whatever.com'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        company.linkedin_url = nil

        is_expected.to be_valid
      end
    end

    describe 'facebook_url' do
      it 'is a valid facebook_url, then returns valid' do
        company.facebook_url = 'https://facebook.com/dealbook'

        is_expected.to be_valid
      end

      it 'is not a valid facebook_url, then returns invalid' do
        company.facebook_url = 'facebook@whatever.com'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        company.facebook_url = nil

        is_expected.to be_valid
      end
    end

    describe 'twitter_url' do
      it 'is a valid twitter_url, then returns valid' do
        company.twitter_url = 'https://twitter.com/dealbook'

        is_expected.to be_valid
      end

      it 'is not a valid twitter_url, then returns invalid' do
        company.twitter_url = 'twitter@whatever.com'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        company.twitter_url = nil

        is_expected.to be_valid
      end
    end
  end
end
