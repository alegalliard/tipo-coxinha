class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    "R$ #{@builder.number_field(attribute_name, merged_input_options)} #{currency_addon(currency)}".html_safe
  end

  def currency_addon(currency)
    content_tag(:span, currency, class: "input-group-addon")
  end
end
