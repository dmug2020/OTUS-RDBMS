use voip;
select
       op.ID                                                    as oper_id,
       op.OPERNAME                                              as oper_name,
       dense_rank() over(order by SUBSTRING(op.OPERNAME, 1, 1)) as number,
       row_number() over(f_part order by op.OPERNAME)           as num_in_part,
       count(*) over f_part                                     as total_in_part,
       count(*) over f_all                                   as count_opers,
       lag(op.ID, 1) over f_all                              as prev_oper_id,
       lead(op.ID, 1) over f_all                             as next_oper_id,
       lag(op.OPERNAME, 2) over f_all                        as oper_name_two_back_rows
from operators as op window
    f_all as (),
    f_part as (partition by SUBSTRING(op.OPERNAME, 1, 1));
