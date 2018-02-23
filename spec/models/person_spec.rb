# frozen_string_literal: true

describe Person do
  subject(:person) { build(:person) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }

    describe 'permalink' do
      it 'is a valid slug, then returns valid' do
        person.permalink = 'right-permalink'

        is_expected.to be_valid
      end

      it 'is not a valid permalink, then returns invalid' do
        person.name = nil
        person.permalink = 'wrong permalink'

        is_expected.not_to be_valid
        expect(person.errors[:permalink]).to eq(['is invalid'])
      end
    end

    describe 'born_date' do
      it 'is a valid born_date, then returns valid' do
        person.born_date = 18.years.ago.to_date

        is_expected.to be_valid
      end

      context 'when is not a valid date' do
        it 'is not a valid born_date, then returns invalid' do
          person.born_date = 'i-am-not-a-date'

          is_expected.to_not be_valid
        end

        it 'is not a valid born_date because is in the future' do
          person.born_date = 10.years.from_now.to_date

          is_expected.to_not be_valid
        end
      end
    end

    it do
      is_expected.to(
        validate_inclusion_of(:gender).in_array(described_class::GENDERS)
      )
    end

    describe 'email' do
      it 'is a valid email, then returns valid' do
        person.email = 'myemail@gmail.com'

        is_expected.to be_valid
      end

      it 'is not a valid email, then returns invalid' do
        person.email = 'i-am-not-an-email'

        is_expected.to_not be_valid
      end

      it 'could be nil' do
        person.email = nil

        is_expected.to be_valid
      end
    end

    describe 'website_url' do
      it 'is a valid website_url, then returns valid' do
        person.website_url = 'https://dealbook.com'

        is_expected.to be_valid
      end

      it 'is not a valid website_url, then returns invalid' do
        person.website_url = 'dealbook.xls'

        is_expected.to_not be_valid
      end

      it 'can be blank' do
        person.website_url = nil

        is_expected.to be_valid
      end
    end

    describe 'facebook_url' do
      it 'is a valid facebook_url, then returns valid' do
        person.facebook_url = 'https://dealbook.com'

        is_expected.to be_valid
      end

      it 'is not a valid facebook_url, then returns invalid' do
        person.facebook_url = 'dealbook.xls'

        is_expected.to_not be_valid
      end

      it 'can be blank' do
        person.facebook_url = nil

        is_expected.to be_valid
      end
    end

    describe 'twitter_url' do
      it 'is a valid twitter_url, then returns valid' do
        person.twitter_url = 'https://twitter.com/dealbook'

        is_expected.to be_valid
      end

      it 'is not a valid twitter_url, then returns invalid' do
        person.twitter_url = 'twitter@whatever.com'

        is_expected.to_not be_valid
      end

      it 'can be blank' do
        person.twitter_url = nil

        is_expected.to be_valid
      end
    end

    describe 'google_plus_url' do
      it 'is a valid google_plus_url, then returns valid' do
        person.google_plus_url = 'https://dealbook.com'

        is_expected.to be_valid
      end

      it 'is not a valid google_plus_url, then returns invalid' do
        person.google_plus_url = 'dealbook.xls'

        is_expected.to_not be_valid
      end

      it 'can be blank' do
        person.google_plus_url = nil

        is_expected.to be_valid
      end
    end

    describe 'linkedin_url' do
      it 'is a valid linkedin_url, then returns valid' do
        person.linkedin_url = 'https://dealbook.com'

        is_expected.to be_valid
      end

      it 'is not a valid linkedin_url, then returns invalid' do
        person.linkedin_url = 'dealbook.xls'

        is_expected.to_not be_valid
      end

      it 'can be blank' do
        person.linkedin_url = nil

        is_expected.to be_valid
      end
    end
  end

  describe 'relations' do
    it { is_expected.to have_many(:person_companies).dependent(:destroy) }

    it { is_expected.to have_many(:locations).through(:localizables) }

    it { is_expected.to have_one(:investor) }
  end
end
