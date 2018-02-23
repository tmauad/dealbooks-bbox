# frozen_string_literal: true

describe PeopleHelper do
  describe '#latest_company' do
    let(:person) { create(:person) }

    subject(:latest_company) { helper.latest_company(person) }

    it 'returns the company name of current company' do
      company = create(:company)
      _current_company = create(
        :person_company, :current, person: person, company: company
      )

      expect(latest_company).to eq(company.name)
    end

    it 'returns the last company name' do
      company = create(:company)
      _current_company = create(
        :person_company, person: person, company: company
      )

      expect(latest_company).to eq(company.name)
    end

    it 'returns the last company name' do
      expect(latest_company).to eq('Unknown')
    end
  end

  describe '#investor_category' do
    let(:person) { create(:person) }

    subject(:investor_category) { helper.investor_category(person) }

    it 'returns the category' do
      # has to be an investor
      investor_profile = create(:investor, investable: person)

      expect(investor_category).to eq(investor_profile.category)
    end

    context 'when the person is not an investor' do
      it 'returns the category' do
        expect(investor_category).to eq(nil)
      end
    end
  end
end
