{% macro convert_currency(amount, from_currency, to_currency) %}

    {%- set conversion_rates = {
        'USD': {
            'GBP': 0.75,
            'EUR': 0.85
        },
        'GBP': {
            'USD': 1.33,
            'EUR': 1.13
        },
        'EUR': {
            'USD': 1.18,
            'GBP': 0.88
        }
    } -%}

    {%- if from_currency == to_currency -%}
        {{ amount }}
    {%- else -%}
        {%- set rate = conversion_rates[from_currency][to_currency] -%}
        {{ amount }} * {{ rate }}
    {%- endif -%}

{% endmacro %}