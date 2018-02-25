# frozen_string_literal: true

class SearchService
  def initialize(model, filter_params)
    @base_query = model.all
    @filter_params = filter_params
  end

  def fetch
    return base_query if filter_params.blank?

    fields.each_with_index.map do |field, index|
      @base_query = base_query.where(
        "#{field_of_query(field)} #{operator_of_query(index)} ?",
        value_of_query(field, index)
      )
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
  def value_of_query(field, index)
    if field == 'equal'
      values[index]
    else
      "%#{values[index]}%"
    end
  end

  def field_of_query(field)
    field.downcase.tr(' ', '_')
  end

  # Translate the signal to an equivalent in SQL
  def operator_of_query(index)
    SIGNALS.fetch(
      operators[index].downcase.to_sym # Eg.: :equal
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
