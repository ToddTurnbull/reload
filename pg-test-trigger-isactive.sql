set search_path to tempdb;

begin;
  select 'before', isactive, deleted::date, modified::date from org where id = 2003;
  update org set isactive = false where id = 2003;
  select 'updated', isactive, deleted::date, modified::date from org where id = 2003;
  rollback;
  select 'rollback', isactive, deleted::date, modified::date from org where id = 2003;
