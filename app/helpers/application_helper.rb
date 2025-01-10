module ApplicationHelper
  def humanized_number(number, options = {})
    default_options = {
      units: { thousand: 'K', million: 'M', billion: 'B' },
      precision: 1,
      separator: '.'
    }
    number_to_human(number, default_options.merge(options))
  end
end
