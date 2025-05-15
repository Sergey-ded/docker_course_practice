{{
  config(
    materialized = 'table'
    )
}}
select
    model.ticket_no,
    model.book_ref,
    REPLACE(model.passenger_id, ' ', '')::bigint as passenger_id,
    model.passenger_name,
    model.contact_data
from
    {{ ref('stg_flights_tickets') }} model
where
  REPLACE(model.passenger_id, ' ', '')::bigint not in (select id from {{ ref('staff_id') }})