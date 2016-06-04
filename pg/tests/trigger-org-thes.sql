set search_path to tempdb;

select * from org_thes where org_id = 2003;
select id, modified from org where id = 2003;

begin;
  insert into org_thes(org_id, thes_id, official_id) values(2003, 3, 3);
  select * from org_thes where org_id = 2003 and official_id = 3;
  select id, modified from org where id = 2003;
  delete from org_thes where org_id = 2003 and thes_id = 3;
  select * from org_thes where org_id = 2003 and official_id = 3;
  select id, modified from org where id = 2003;
rollback;

select * from org_thes where org_id = 2003;
select id, modified from org where id = 2003;
