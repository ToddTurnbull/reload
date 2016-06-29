set search_path to tempdb;

\qecho 'Testing name_inserted_updated()'

begin;
  select sort_key, level, name
    from tblorgname
    where orgnametypeid = 1
    order by sort_key;
  insert into tblorgname(orgnametypeid, name)
    values(1, 'xxx');
  select *
    from tblorgname
    where name = 'xxx';
  select sort_key, level, name
    from tblorgname
    where orgnametypeid = 1
    order by sort_key;
  update tblorgname
    set parentid = 6955
    where id = 10743;
  select id, sort_key, name
    from tblorgname
    where sort_key like '.5441%'
    order by sort_key;

rollback;
