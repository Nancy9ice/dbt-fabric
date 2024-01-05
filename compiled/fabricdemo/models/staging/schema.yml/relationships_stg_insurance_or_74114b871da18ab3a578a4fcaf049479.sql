
    
    

with child as (
    select insurance_key as from_field
    from "dbt-fabric project"."dbo_staging"."stg_insurance_org"
    where insurance_key is not null
),

parent as (
    select insurance_key as to_field
    from "dbt-fabric project"."dbo_healthcare"."dim_patients"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


