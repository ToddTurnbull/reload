set search_path to tempdb;

begin;
  select updated from org where id = 2003;
  select updated from orgupdated where orgid = 2003;

  update org set updated = now() where id = 2003;

  select updated from org where id = 2003;
  select updated from orgupdated where orgid = 2003;

  rollback;

  select updated from org where id = 2003;
  select updated from orgupdated where orgid = 2003;
