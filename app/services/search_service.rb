# frozen_string_literal: true

class SearchService
  def initialize(model, filter_params)
    @base_query = model.all
    @filter_params = filter_params
  end

  def fetch
    return base_query if filter_params.blank?

    fields.each_with_index.map do |field, index|
      query = [
        "#{field_of_query(field)} #{operator_of_query(index)} ?",
        value_of_query(index)
      ]

      @base_query = base_query.where(*query)
    end

    base_query
  end

  private

  attr_reader :base_query, :filter_params

  SIGNALS = {
    equal: '=',
    alike: 'ILIKE',
    greater_than: '>=',
    less_than: '<='
  }.freeze
  private_constant :SIGNALS

  # Adds or no the %% SQL operator in the query
  def value_of_query(index)
    return "%#{values[index]}%" if operators[index] == 'alike'

    values[index]
  end

  def field_of_query(field)
    field.downcase.tr(' ', '_')
  end

  # Translate the signal to an equivalent in SQL
  def operator_of_query(index)
    SIGNALS.fetch(
      operators[index].downcase.tr(' ', '_').to_sym # Eg.: :equal
    )
  end

  # Comes like this "Name , Description"
  # Returns like this ["name", "description"]
  def fields
    filter_params[:fields].split(',').map(&:strip)
  end

  def operators
    filter_params[:operators].split(',').map(&:strip)
  end

  def values
    filter_params[:values].split(',').map(&:strip)
  end
end
