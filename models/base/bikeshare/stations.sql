
{{ config(materialized='incremental') }}


/*

This syntax (column: TYPE AS alias) isn’t valid in BigQuery SQL. BigQuery expects
either a simple column reference, a cast, or an alias, so they aren't defined here.

*/

WITH final AS (
    SELECT 
        station_id              AS station_id,
        name                    AS station_name,
        status                  AS station_status,
        location                AS station_coordinates,
        address                 AS station_street_address,
        alternate_name          AS station_aliias,
        city_asset_number       AS city_asset_number,
        property_type           AS station_type,
        number_of_docks         AS dock_count,
        power_type              AS station_power_type,
        footprint_length        AS station_length,
        footprint_width         AS station_width,
        notes                   AS station_notes,
        council_district        AS city_council_district,
        modified_date           AS last_modified_date
    FROM {{ source('austin_bikeshare', 'bikeshare_stations') }}
    )

SELECT * FROM final