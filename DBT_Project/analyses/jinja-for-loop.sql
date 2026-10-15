{% set ns = namespace(running_total = 0) %}
{% for num in [10, 20, 30] %}                     {# Ek chhota sa loop chalaya #}
    {% set ns.running_total = ns.running_total + num %} {# Loop ke andar variable ki value ko update/add kiya #}
{% endfor %} 

select {{ns.running_total}} as total