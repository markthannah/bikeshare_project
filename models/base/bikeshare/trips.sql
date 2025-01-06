{{ config(materialized='incremental') }}


/*

  This syntax (column: TYPE AS alias) isn’t valid in BigQuery SQL. BigQuery expects
  either a simple column reference, a cast, or an alias, so they aren't defined here.

*/

WITH final AS (
    SELECT 
        trip_id                 AS trip_id,
        subscriber_type         AS subscriber_type,
        bike_id                 AS bike_id,
        bike_type               AS bike_type,
        start_time              AS trip_started_at,
        start_station_id        AS start_station_id,
        start_station_name      AS start_station_name,
        end_station_id          AS end_station_id,
        end_station_name        AS end_station_name,
        duration_minutes        AS duration_minutes
    FROM {{ source('austin_bikeshare', 'bikeshare_trips') }}
    )

SELECT * FROM final