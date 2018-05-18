# frozen_string_literal: true

class ImportOldDatabaseService
  class ImportInvestor
    PERSONS = %w[
diether-werninghaus flavio-jansen
gilmar-francisco-pertile kai-schoppen hans-hickler in-hsieh joao-alceu-amoroso-lima
jose-marin joe-lonsdale adriana-cisneros peter-fernandez fabrice-grinda
christian-gessner stefan-schimenes patrick-lisbona peter-thiel fernanda-feitosa
luis-carlos-freitas tony-perkins ted-maidenberg marcelo-loureiro niraj-shah
christian-friedland martin-varsavsky romero-rodrigues luis-mario-bilenky
christian-ribeiro anibal-messa kees-koolen nicolas-gautier lee-jacobs gui-afonso
bruno-sales-rabelo jonathan-coon mike-levinthal rafael-bertani galen-hardy
cassio-spina gabriel-jaramillo rodrigo-borges antonio-henrique-prado
eduardo-steiner pedro-navio bryan-johnson craig-earnshaw antonio-carlos-soares
silvio-genesini antonio-de-athayde nicolas-berggruen joao-kepler-braga carlos-gamboa
felipe-melo mario-letelier mauricio-de-chiaro john-berkowitz carlos-andre-montenegro
mayer-mizrachi luis-loaiza alberto-vera mark-goines peter-kellner guilherme-horn
thiago-sarraf fabio-povoa rodrigo-dantas daniel-amato ron-burkle vinod-khosla steve-case
guilherme-cruz warburg-pincus marcelo-maisonnave rodrigo-quinalha thamila-zaher pedro-sirotsky
george-soros enrique-collado rafael-assuncao marco-poli eduardo-smith paulo-ferraz
]

    def run
      ImportOldDatabaseService::Entities::Investor.find_each do |investor|
        printf('.')

        @investor = investor

        if PERSONS.include?(investor.slug)
          @person = ::Person.create!(
            first_name: investor.name,
            # last_name: '',
            permalink: investor.slug.strip.presence,
            description: investor.description.presence,
            # born_date: '',
            # gender: '',
            # phone_number: '',
            # occupation: '',
            # email: '',
            website_url: investor.website.strip.presence,
            # facebook_url: '',
            # twitter_url: '',
            # google_plus_url: '',
            linkedin_url: investor.linkedin.strip.presence
          )

          @new_investor1 = ::Investor.create!(
            investable: @person,
            status: investor.status || Investor::ACTIVE,
            category: ::Investor::ANGEL,
            # stage: investor.stage.strip.presence
          )
        else
          @company = Company.find_by(permalink: investor.slug.strip.presence)

          unless @company
            @company = ::Company.create!(
              name: investor.name.presence,
              permalink: investor.slug.strip.presence,
              description: investor.description.presence,
              # employees_count: '',
              # born_date: '',
              # phone_number: '',
              # email: '',
              website_url: investor.website.try(:strip).presence,
              linkedin_url: investor.linkedin.try(:strip).presence,
              # facebook_url: '',
              # twitter_url: '',
              # google_plus_url: '',
              status: investor.status || Investor::ACTIVE
            )
          end

          @new_investor2 = ::Investor.create!(
            investable: @company,
            status: investor.status || Investor::ACTIVE,
            category: ::Investor::ANGEL,
            # stage: investor.stage.strip.presence
          )
        end

      rescue => e
        require 'pry'; binding.pry

        raise
      end

      warn "\nImported investor - final statistics"
      warn "count: #{::Investor.count} investors"
    end
  end
end
