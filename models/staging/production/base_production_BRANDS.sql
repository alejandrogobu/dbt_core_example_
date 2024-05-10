with source as (
      select * from {{ source('production', 'BRANDS') }}
),
renamed as (
    select
        {{ adapter.quote("BRAND_ID") }},
        {{ adapter.quote("BRAND_NAME") }},
        {{ adapter.quote("_FIVETRAN_DELETED") }},
        {{ adapter.quote("_FIVETRAN_SYNCED") }}

    from source
)
select * from renamed
  