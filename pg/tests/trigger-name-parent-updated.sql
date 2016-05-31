set search_path to tempdb;

begin;
select n.id, n.name, n.level
    from org_names as o join tblorgname as n on o.org_name_id = n.id
    where o.org_id = 2003
    and o.org_name_id = any(select id from tblorgname where orgnametypeid = 1)
    order by n.level;

  update tblorgname set parentid = 350 where id = 3065;

select n.id, n.name, n.level
    from org_names as o join tblorgname as n on o.org_name_id = n.id
    where o.org_id = 2003
    and o.org_name_id = any(select id from tblorgname where orgnametypeid = 1)
    order by n.level;

  rollback;

select n.id, n.name, n.level
    from org_names as o join tblorgname as n on o.org_name_id = n.id
    where o.org_id = 2003
    and o.org_name_id = any(select id from tblorgname where orgnametypeid = 1)
    order by n.level;

