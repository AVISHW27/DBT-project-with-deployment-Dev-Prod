{# --- ADVANCED JINJA VARIABLES & CONCEPTS --- #}

{% set is_active = true %}                        {# 1. Boolean Type: True ya False values store karne ke liye #}
{% set global_limit = var('my_limit', 100) %}     {# 2. dbt Global Variable: 'dbt_project.yml' se value uthata hai, agar na mile toh default 100 dega #}
{% set db_user = env_var('DB_USER', 'guest') %}   {# 3. Environment Variable: System ya OS ke environment se secret/value read karta hai #}

{# 4. Namespace Object: Yeh bahut important hai! Jinja loops ke andar normal variables update nahi hote, isliye 'namespace' use hota hai #}
{% set ns = namespace(running_total = 0) %}       {# Namespace ke andar ek variable banaya #}
{% for num in [10, 20, 30] %}                     {# Ek chhota sa loop chalaya #}
    {% set ns.running_total = ns.running_total + num %} {# Loop ke andar variable ki value ko update/add kiya #}
{% endfor %}                                      {# Loop khatam kiya #}

SELECT 
    {{ is_active }} AS boolean_col,               {# Boolean value ko print kiya (Databricks mein true/false banega) #}
    {{ global_limit }} AS config_limit,           {# dbt_project.yml se aayi limit print ki #}
    '{{ db_user }}' AS env_username,              {# Environment variable wali string print ki #}
    {{ ns.running_total }} AS loop_calculated_sum {# Loop ke andar calculate hua total sum print kiya #}