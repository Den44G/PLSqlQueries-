SELECT DISTINCT an.rej_timestamp, rj.text,pr.name,pr.first_name,pr.mid_name,pr.birthday,ci.entry,idnum."number",a.street,a.house,a.flat,c.c_text
FROM analysis an
INNER JOIN rej_reason_tx rj on an.reason=rj.pid 
INNER JOIN partner pr on an.partner_uuid=pr.uuid 
INNER JOIN comm_mean cm on cm.communication_uuid = pr.commnctn_uuid 
INNER JOIN comm_item ci on ci.uuid=cm.comm_item_uuid
INNER JOIN idnumber idnum on pr.uuid = idnum.partner_uuid
INNER JOIN partner_address_reference par on par.partner_uuid=pr.uuid
INNER JOIN address_reference adr on adr.uuid=par.address_ref_uuid
INNER JOIN address a on adr.address_uuid=a.uuid
INNER JOIN city c on a.city_id=c.id
INNER JOIN state_region sr on sr.state=a.state
WHERE an.rejected = 1
AND an.rej_date > '16.10.2016'
AND rj.lang = 'RU'
AND ci.communication_type in (040,010,990)
AND ci.entry not in('0','0000000000')
AND idnum.c_type = '020'
--select t.entry,t.description from COMM_ITEM t 
--WHERE t.uuid in (select cm.comm_item_uuid from comm_mean cm where cm.communication_uuid = '7B674338457B46868EABD953519DED72') 
--AND t.communication_type in ('990','040','010')

