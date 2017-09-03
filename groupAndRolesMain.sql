--Select distinct lr.title
select lr.title as Роль, lg.description as Группа , lu.login 
from GROUP_ROLE t 
inner join lrole lr on t.role_uuid=lr.uuid
inner join lgroup lg on t.group_uuid= lg.uuid 
inner join user_group ug on lg.uuid=ug.group_uuid
inner join luser lu on lu.uuid=ug.user_uuid
--where lg.description like '%iev' 
where lu.c_active != 1 
order by lr.title
