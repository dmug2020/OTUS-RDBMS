use voip;
with oper_all as (
    select op.ID       as oper_id,
           op.OPERNAME as oper_name,
           op.ORGNAME  as oper_orgname
    from operators as op)
select o.oper_id,
       o.oper_name,
       o.oper_orgname,
       ntile(3) over() as group_number
from oper_all as o
         left join operators as oper on o.oper_id = oper.ID
group by o.oper_id,
         o.oper_name,
         o.oper_orgname;