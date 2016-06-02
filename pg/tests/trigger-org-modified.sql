set search_path to tempdb;

select modified from org where id = 2003;

-- org_modified()
begin;
  select org_modified(2003);
  select modified from org where id = 2003;
rollback;

select modified from org where id = 2003;
select address
  from org_address_rel as o join tbladdress as a on o.address_id = a.id
  where org_id = 2003;

-- address_updated()
begin;
  update tbladdress
    set address = 'King'
    from org_address_rel
    where org_id = 2003 and address_id = tbladdress.id;
  select modified from org where id = 2003;
  select address
    from org_address_rel as o join tbladdress as a on o.address_id = a.id
    where org_id = 2003;
rollback;

select modified from org where id = 2003;
select address
  from org_address_rel as o join tbladdress as a on o.address_id = a.id
  where org_id = 2003;

-- org_address_deleted()
select modified from org where id = 2003;
select * from org_address_rel where org_id = 2003;

begin;
  delete from org_address_rel where org_id = 2003;
  select modified from org where id = 2003;
  select * from org_address_rel where org_id = 2003;
rollback;

select * from org_address_rel where org_id = 2003;
select modified from org where id = 2003;

-- org_address_inserted()
begin;
  insert into org_address_rel(org_id, address_id)
    select org_id, address_id
    from org_address_rel 
    where org_id = 2003;
  select * from org_address_rel where org_id = 2003;
  select modified from org where id = 2003;
rollback;
