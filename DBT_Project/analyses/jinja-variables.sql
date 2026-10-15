{% set app_name = "dbt-Databricks" %} 
{% set build_version = 2.5 %}
{% set layers = ['bronze', 'silver', 'gold'] %}
{% set user_info = {'name': 'Ajay', 'role': 'DE'} %}

SELECT '{{ app_name }}' AS string,
{{ build_version }} AS Num,
'{{layers[0]}}' AS List,
'{{user_info['name']}}' AS Dictionary