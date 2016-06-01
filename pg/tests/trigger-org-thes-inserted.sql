set search_path to tempdb;

begin;
  select * from org_thes where org_id = 2003;

  insert into org_thes(org_id, thes_id, official_id) values(2003, 3, 3);

  select * from org_thes where org_id = 2003 and official_id = 3;

rollback;

  select * from org_thes where org_id = 2003;
