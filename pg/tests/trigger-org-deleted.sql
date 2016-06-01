set search_path to tempdb;

begin;
  select id from org where id = 2003;

  -- should fail if rows in related tables exist, so org_deleted should not fire
  delete from org where id = 2003;

  select * from org_del where id = 2003;

  select id from org where id = 2003;

rollback;

  select * from org_del where id = 2003;
  select id from org where id = 2003;
