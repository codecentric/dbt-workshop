
{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('customers', 'calculate customer lifetime value') %}

  {% call dbt_unit_testing.mock_ref ("stg_customers", {"input_format": "csv"}) %}
    customer_id::INT64,first_name::STRING,last_name::STRING
    1,"Adam","A."
    2,"Berta","B."
    3,"Carla","C."
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ("stg_orders", {"input_format": "csv"}) %}
    order_id::INT64,customer_id::INT64,order_date::DATE,status::STRING
    1,1,"2023-01-01","returned"
    2,1,"2023-01-02","delivered"
    3,1,"2023-01-03","shipped"
    4,1,"2023-01-04","created"
    5,2,"2023-01-05","delivered"
    6,2,"2023-01-06","shipped"
    7,2,"2023-01-07","created"
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ("stg_payments", {"input_format": "csv"}) %}
    payment_id::INT64,order_id::INT64,payment_method::STRING,amount::NUMERIC
    1,1,"credit_card",10
    2,2,"gift_card",20
    3,3,"credit_card",30
    4,4,"gift_card",40
    5,5,"credit_card",50
    6,6,"gift_card",60
    7,7,"credit_card",70
  {% endcall %}

  {% call dbt_unit_testing.expect({"input_format": "csv"}) %}
    customer_id::INT64,first_name::STRING,last_name::STRING,most_recent_order::DATE,number_of_orders::INT64,customer_lifetime_value::NUMERIC
    1,"Adam","A.","2023-01-04",4,100
    2,"Berta","B.","2023-01-07",3,180
    3,"Carla","C.",null,null,null
  {% endcall %}

{% endcall %}
