{# --- FOR LOOP WITH IF-ELSE EXAMPLE --- #}
{% set numbers = [5, 7, 2, 13] %}                {# Ek list banai numbers ki #}

SELECT 
    {% for n in numbers %}                         {# Numbers list par loop shuru kiya #} 
            {% if n % 2 == 0 %}                    {# Agar number 2 se poora divide hota hai (Even number) #}
                'Even {{ n }}'                             {# Toh 'Even' print karo #}
            {% else %}                             {# Agar nahi hota (Odd number) #}
                'Odd'                               {# Toh 'Odd' print karo #}
            {% endif %}                            {# If-Else condition ko close kiya #}
            AS status_{{ n }}                      {# Har column ka dynamic naam banaya #}
            {% if not loop.last %},{% endif %}     {# Agar yeh aakhri item nahi hai toh comma lagao #}
        {% endfor %}                               {# Loop ko yahan end kiya #}