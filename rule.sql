{% macro get_rule_validation_cols(model_name, rule_name) %}
{% if model_name == "collateral_charge" %}
    {% if rule_name == "rule_mandatory_check" %}
    {{ return([ "CollateralID"]) }}
    {% elif rule_name == "rule_format_check" %}
    {{ return
    (
        {
        "CollateralID" : "STRING", 
        "ChargeTypeID":"STRING",
        "ChargeHolderID":"STRING",
        "ChargeOrderID":"STRING",
        "ChargeValue":"STRING"
        }
    ) 
    }}
    {% else %}
    {{ exceptions.raise_compiler_error("Invalid `rule_name`. received: " ~ rule_name) }}
    {% endif %}
{% else %}
    {{ exceptions.raise_compiler_error("Invalid `model_name`. received: " ~ model_name) }}
{% endif %}
{% endmacro %}
