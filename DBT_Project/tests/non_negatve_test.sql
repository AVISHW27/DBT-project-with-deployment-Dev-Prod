select 
*from
{{ ref('bronze_sales') }}
where gross_amount<0 and net_amount<0 --Agar saare records mein gross_amount aur net_amount positive hain, 
--toh where gross_amount < 0 or net_amount < 0 condition match nahi hogi. Query 0 rows return karegi --> Test Pass ✅