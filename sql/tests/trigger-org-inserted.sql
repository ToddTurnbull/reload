set search_path to tempdb;

begin;
  select new_cic_id();

  insert into org(org_name_id, cic_id, service_level)
  values(350, new_cic_id(), 'Nonprofit');

  select n.name, n.level
    from org_names as o join tblorgname as n on o.org_name_id = n.id
    where o.org_id = (select max(id) from org)
    order by n.level;

rollback;

select new_cic_id();
