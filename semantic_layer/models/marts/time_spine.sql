with dates as (

    select explode(
        sequence(
            to_date('2020-01-01'),
            to_date('2030-12-31'),
            interval 1 day
        )
    ) as date_day

)

select *
from dates