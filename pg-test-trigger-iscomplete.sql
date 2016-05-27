set search_path to tempdb;

begin;
  select 'before', iscomplete, deleted::date, modified::date from org where id = 2003;
  update org set iscomplete = false where id = 2003;
  select 'updated', iscomplete, deleted::date, modified::date from org where id = 2003;
  rollback;
  select 'rollback', iscomplete, deleted::date, modified::date from org where id = 2003;
