UPDATE lgroup 
SET c_active = 0
WHERE uuid not in
(select distinct lg.uuid from lgroup lg inner join user_group ug on lg.uuid=ug.group_uuid
inner join luser u on u.uuid=ug.user_uuid where u.c_active=1)
