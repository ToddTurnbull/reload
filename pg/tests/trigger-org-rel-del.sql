set search_path to tempdb;

\qecho 'Testing address_deleted()'

select rel_id, table_id, added, deleted
  from org_rel_del
  where org_id = 2003 and table_id = 271;

begin;
  delete from org_address_rel where org_id = 2003;
  select * from org_address_rel where org_id = 2003;
  select rel_id, table_id, added, deleted
    from org_rel_del
    where org_id = 2003 and table_id = 271;
rollback;

\qecho 'Testing comm_deleted()'

select rel_id, table_id, added, deleted
  from org_rel_del
  where org_id = 2003 and table_id = 270;

begin;
  delete from org_comm_rel where org_id = 2003;
  select * from org_comm_rel where org_id = 2003;
  select rel_id, table_id, added, deleted
    from org_rel_del
    where org_id = 2003 and table_id = 270;
rollback;

\qecho 'Testing contact_deleted()'

select rel_id, table_id, added, deleted
  from org_rel_del
  where org_id = 2000 and table_id = 272;

begin;
  delete from org_contact_rel where org_id = 2000;
  select * from org_contact_rel where org_id = 2000;
  select rel_id, table_id, added, deleted
    from org_rel_del
    where org_id = 2000 and table_id = 272;
rollback;

\qecho 'Testing service_deleted()'

select rel_id, table_id, added, deleted
  from org_rel_del
  where org_id = 2003 and table_id = 275;

begin;
  delete from org_service_rel where org_id = 2003;
  select * from org_service_rel where org_id = 2003;
  select rel_id, table_id, added, deleted
    from org_rel_del
    where org_id = 2003 and table_id = 275;
rollback;


begin;
  delete from org_names
    using tblorgname
    where tblorgname.id = org_name_id and orgnametypeid != 1 and org_id = 2003;
  select *
    from org_rel_del
    where org_id = 2003 and table_id = 249;
rollback;
