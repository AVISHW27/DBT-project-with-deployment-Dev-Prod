{% set role = "admin" %}

SELECT 
    {% if role == "admin" %}
        'Full Access' AS access_level
    {% else %}
        'Limited Access' AS access_level
    {% endif %}