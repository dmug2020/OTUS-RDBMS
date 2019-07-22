use voip;
with payments_operators as (
    with operators_prepared as (
        select op.ID       as oper_id,
               op.OPERNAME as oper_name
        from operators as op
    ),
         cal_payments as (
             select p.ID                                                             as payment_id,
                    p.OPER_ID                                                        as oper_id,
                    if(trim(p.CUR_NAME) = 'USD', p.PAY_SUM, p.PAY_SUM * p.EXCH_RATE) as payment_sum_usd,
                    p.PAY_DATE                                                       as payment_date
             from PAY as p
             where p.oper_id is not null
         )
    select distinct payments.oper_id                                                      as oper_id,
                    opers.oper_name                                                       as oper_name,
                    payments.payment_sum_usd                                              as payment_sum,
                    payments.payment_date                                                 as payment_date,
                    row_number() over(partition by oper_id order by payment_sum_usd desc) as payment_rate

    from cal_payments as payments
             inner join operators_prepared as opers using (oper_id)
)
select oper_id,
       oper_name,
       payment_sum,
       payment_date,
       if(payment_rate = 1, 1, 0) as is_max
from payments_operators
where payment_rate in (1, 2);
