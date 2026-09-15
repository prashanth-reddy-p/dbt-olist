with geolocations as (
select * from {{source('olist','geolocations')}}
)
select 
geolocation_zip_code_prefix,
geolocation_lat :: float as geolocation_lat,
geolocation_lng :: float as geolocation_lng,
geolocation_city,
geolocation_state
from geolocations