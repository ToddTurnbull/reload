set search_path to tempdb;

\qecho 'Testing org_modified()'

select id, modified from org where id = 2003;

begin;
  select org_modified(2003);
  select id, modified from org where id = 2003;
rollback;

select id, modified from org where id = 2003;

\qecho 'Testing address_updated()'

select a.address
  from org_address_rel as o join tbladdress as a on o.address_id = a.id
  where o.org_id = 2003;

begin;
  update tbladdress
    set address = 'King'
    from org_address_rel
    where org_id = 2003 and address_id = tbladdress.id;
  select id, modified from org where id = 2003;
  select a.address
    from org_address_rel as o join tbladdress as a on o.address_id = a.id
    where o.org_id = 2003;
rollback;

select a.address
  from org_address_rel as o join tbladdress as a on o.address_id = a.id
  where o.org_id = 2003;
select id, modified from org where id = 2003;

\qecho 'Testing comm_updated()'

select c.value
  from org_comm_rel as o join tblcomm as c on o.comm_id = c.id
  where o.org_id = 2003;

begin;
  update tblcomm
    set value = 'google.ca'
    from org_comm_rel
    where commtypeid = 7 and org_id = 2003 and comm_id = tblcomm.id;
  select id, modified from org where id = 2003;
  select c.value
    from org_comm_rel as o join tblcomm as c on o.comm_id = c.id
    where o.org_id = 2003;
rollback;

select c.value
  from org_comm_rel as o join tblcomm as c on o.comm_id = c.id
  where o.org_id = 2003;
select id, modified from org where id = 2003;

\qecho 'Testing contact_updated()'
select id, modified from org where id = 2000;
select c.name
  from org_contact_rel as o join tblcontact as c on o.contact_id = c.id
  where o.org_id = 2000;

begin;
  update tblcontact
  set name = 'Andrew Beamish'
  from org_contact_rel
  where org_id = 2000 and contact_id = tblcontact.id;
  select c.name
    from org_contact_rel as o join tblcontact as c on o.contact_id = c.id
    where o.org_id = 2000;
  select id, modified from org where id = 2000;
rollback;

select c.name
  from org_contact_rel as o join tblcontact as c on o.contact_id = c.id
  where o.org_id = 2000;
select id, modified from org where id = 2000;

\qecho 'Basic testing of ic_*_deleted()'

select ic_agencies.orgid, ic_agency_sites.siteid, ic_site_services.serviceid
  from ic_agencies
    join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
    join ic_site_services on ic_agency_sites.id = ic_site_services.siteid
  where orgid in (2000);

begin;
  delete from ic_site_services
    using ic_agencies as a join ic_agency_sites as s on a.id = s.agencyid
    where a.orgid = 2000 and s.id = ic_site_services.siteid;
  delete from ic_agency_sites
    using ic_agencies a
    where a.orgid = 2000 and a.id = ic_agency_sites.agencyid;
  delete from ic_agencies where orgid = 2000;
  select id, modified from org where id = 2000;
rollback;

select ic_agencies.orgid, ic_agency_sites.siteid, ic_site_services.serviceid
  from ic_agencies
    join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
    join ic_site_services on ic_agency_sites.id = ic_site_services.siteid
  where orgid in (2000);

\qecho 'Testing ic_agency_inserted()'
select id, modified from org where id = 4551;

begin;
  insert into ic_agencies(orgid) values(4551);
  select id, modified from org where id = 4551;
rollback;

select id, modified from org where id = 4551;

\qecho 'Testing ic_agency_updated()'
select id, modified from org where id in (2000, 4551);

begin;
  update ic_agencies
    set orgid = 4551
    where orgid = 2000;
  select id, modified from org where id in (2000, 4551);
  select org.id, org.modified
    from ic_agencies
      join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
      join org on org.id = ic_agency_sites.siteid
    where ic_agencies.orgid = 4551;
  select org.id, org.modified
    from ic_agencies
      join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
      join ic_site_services on ic_agency_sites.id = ic_site_services.siteid
      join org on org.id = ic_site_services.serviceid
    where ic_agencies.orgid = 4551;
rollback;

select id, modified from org where id = 4551;

\qecho 'Testing ic_sites_inserted()'
select id, modified from org where id = 4551;

begin;
  insert into ic_agency_sites(agencyid, siteid)
    select id, 4551 from ic_agencies where orgid = 2000;
  select id, modified from org where id in (2000, 4551);
rollback;

\qecho 'Testing ic_sites_updated()'
select id, modified from org where id in (2000, 4551);

begin;
  update ic_agency_sites
    set siteid = 4551
    where siteid = 2000;
  select id, modified from org where id in (2000, 4551);
  select org.id, org.modified
    from org
      join ic_agencies on org.id = ic_agencies.orgid
      join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
    where ic_agency_sites.siteid = 4551;
  select org.id, org.modified
    from ic_agency_sites
      join ic_site_services on ic_agency_sites.id = ic_site_services.siteid
      join org on org.id = ic_site_services.serviceid
    where ic_agency_sites.siteid = 4551;
rollback;

\qecho 'Testing ic_services_inserted()'
select id, modified from org where id in (2000, 4551);

begin;
  insert into ic_site_services(siteid, serviceid)
    select id, 4551 from ic_agency_sites where siteid = 2000;
  select id, modified from org where id in (2000, 4551);
rollback;

select id, modified from org where id in (2000, 4551);

\qecho 'Basic testing of ic_services_updated()'
begin;
  update ic_site_services
    set serviceid = 4551
    where serviceid = 2000;
  select id, modified from org where id in (2000, 4551);
rollback;

\qecho 'Testing org_address_deleted()'

select * from org_address_rel where org_id = 2003;

begin;
  delete from org_address_rel where org_id = 2003;
  select id, modified from org where id = 2003;
  select * from org_address_rel where org_id = 2003;
rollback;

select * from org_address_rel where org_id = 2003;
select id, modified from org where id = 2003;

\qecho 'Testing org_address_inserted()'

begin;
  insert into org_address_rel(org_id, address_id)
    select org_id, address_id
    from org_address_rel 
    where org_id = 2003;
  select * from org_address_rel where org_id = 2003;
  select id, modified from org where id = 2003;
rollback;

\qecho 'Testing org_comm_deleted()'

select * from org_comm_rel where org_id = 2003;

begin;
  delete from org_comm_rel where org_id = 2003;
  select id, modified from org where id = 2003;
  select * from org_comm_rel where org_id = 2003;
rollback;

select * from org_comm_rel where org_id = 2003;
select id, modified from org where id = 2003;

\qecho 'Testing org_comm_inserted()'

begin;
  insert into org_comm_rel(org_id, comm_id)
    select org_id, comm_id
    from org_comm_rel 
    where org_id = 2003;
  select * from org_comm_rel where org_id = 2003;
  select id, modified from org where id = 2003;
rollback;

\qecho 'Testing org_contact_deleted()'

select * from org_contact_rel where org_id = 2000;

begin;
  delete from org_contact_rel where org_id = 2000;
  select id, modified from org where id = 2000;
  select * from org_contact_rel where org_id = 2000;
  select pub_id, org_id, org_contact_id from pub_org where org_id = 2000;
rollback;

select * from org_contact_rel where org_id = 2000;
select id, modified from org where id = 2000;

\qecho 'Testing org_contact_inserted()'

begin;
  insert into org_contact_rel(org_id, contact_id)
    select org_id, contact_id
    from org_contact_rel 
    where org_id = 2000;
  select * from org_contact_rel where org_id = 2000;
  select id, modified from org where id = 2000;
rollback;

\qecho 'Testing org_names_deleted()'

begin;
  delete from org_names
    using tblorgname
    where tblorgname.id = org_names.org_name_id
      and orgnametypeid != 1
      and org_id = 2000;
  select id, modified from org where id = 2000;
rollback;

select id, modified from org where id = 2000;

\qecho 'Testing org_names_inserted()'

begin;
  insert into org_names(org_id, org_name_id)
    values(2003, 59);
  select org_name_id, added from org_names where org_id = 2003;
  select id, modified from org where id = 2003;
rollback;

select id, modified from org where id = 2003;

\qecho 'Testing org_tax_inserted()'

begin;
  insert into orgtaxlink(orgid, linkid)
    values(2003, 7);
  select linkid, added from orgtaxlink where orgid = 2003;
  select id, modified from org where id = 2003;
rollback;

select id, modified from org where id = 2003;

\qecho 'Testing org_tax_deleted()'

begin;
  delete from orgtaxlink
    where orgid = 2003 and linkid = 11;
  select linkid, added from orgtaxlink where orgid = 2003;
  select id, modified from org where id = 2003;
rollback;

select linkid, added from orgtaxlink where orgid = 2003;
select id, modified from org where id = 2003;

\qecho 'Testing org_thes_deleted()'

select * from org_thes where org_id = 2003;

begin;
  delete from org_thes
    where org_id = 2003 and thes_id = 483;
  select * from org_thes where org_id = 2003;
  select id, modified from org where id = 2003;
rollback;

select * from org_thes where org_id = 2003;
select id, modified from org where id = 2003;

\qecho 'Testing pub_org_inserted()'

select pub_id, added from pub_org where org_id = 2003 and added > '2013-01-01';

begin;
  insert into pub_org(org_id, pub_id) values(2003, 3);
  select pub_id, added from pub_org where org_id = 2003 and added > '2013-01-01';
  select id, modified from org where id = 2003;
rollback;

select id, modified from org where id = 2003;
select pub_id, added from pub_org where org_id = 2003 and added > '2013-01-01';

\qecho 'Testing pub_org_updated()'

select id, pub_id, isactive, org_contact_id, added from pub_org where org_id = 2000;

begin;
  update pub_org set isactive = false where pub_id = 119 and org_id = 2000;
  select id, pub_id, isactive, org_contact_id, added from pub_org where org_id = 2000;
  select id, modified from org where id = 2000;
rollback;

begin;
  update pub_org set org_contact_id = null where pub_id = 119 and org_id = 2000;
  select id, pub_id, isactive, org_contact_id, added from pub_org where org_id = 2000;
  select id, modified from org where id = 2000;
rollback;

\qecho 'Testing service_updated()'

begin;
  update tblservice set dates = null where id = 1688;
  select modified from org where id = 2000;
  select updated from tblservice where id = 1688;
rollback;

select modified from org where id = 2000;
select updated from tblservice where id = 1688;
