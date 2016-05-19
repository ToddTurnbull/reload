set search_path to tempdb;

-- call org_modified() when related tables change: tblcomm, org_comm_rel, etc
drop type if exists org_modified cascade;
create type org_modified as (org_id integer, modified timestamp);

-- dropping org_modified type cascades to org_modified() function
drop function if exists org_modified(org_id integer);
create function org_modified(org_id integer)
  returns org_modified
  as $$
    update org
    set modified = now()
    where id = $1
    returning id, modified;
  $$ language sql;

-- skipping WebChangeTemplate
-- skipping WebAddTemplate
-- skipping WebDataChange
-- skipping DeleteIndex
-- skipping meta_insert_orgname
-- skipping InsertIndex
-- skipping org_meta_delete_names
-- skipping meta_insert_service
-- skipping meta_delete_orgname
-- skipping meta_update_orgname
-- skipping meta_update_service

-- activeDate (org.isactive)
drop function if exists active_date() cascade;
create function active_date()
  returns trigger
  as $$
    begin
      update org
      set deleted = (case isactive when true then null else now() end)
      where org.id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists is_active on org;
create trigger is_active
  after update of isactive
  on org
  for each row
  execute procedure active_date();

-- skipping meta_delete_service
-- skipping meta_update_cicid
-- skipping org_meta_insert_names
-- skipping org_meta_insert_thes
-- skipping org_meta_delete_thes

-- track deletions with org_rel_del tables
-- org_address_del (org_address_rel)
drop function if exists address_deleted() cascade;
create function address_deleted()
  returns trigger
  as $$
    begin
      insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id)
      values(OLD.org_id, OLD.address_id, OLD.added, OLD.note, now(), 271);
    end;
  $$ language plpgsql;

drop trigger if exists address_deleted on org_address_rel;
create trigger address_deleted
  after delete
  on org_address_rel
  for each row
  execute procedure address_deleted();

-- org_comm_del (org_comm_rel)
drop function if exists comm_deleted() cascade;
create function comm_deleted()
  returns trigger
  as $$
    begin
      insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id)
      values(OLD.org_id, OLD.comm_id, OLD.added, OLD.note, now(), 270);
    end;
  $$ language plpgsql;

drop trigger if exists comm_deleted on org_comm_rel;
create trigger comm_deleted
  after delete
  on org_comm_rel
  for each row
  execute procedure comm_deleted();

-- org_contact_del (org_contact_rel)
drop function if exists contact_deleted() cascade;
create function contact_deleted()
  returns trigger
  as $$
    begin
      insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id)
      values(OLD.org_id, OLD.contact_id, OLD.added, OLD.note, now(), 272);
    end;
  $$ language plpgsql;

drop trigger if exists contact_deleted on org_contact_rel;
create trigger contact_deleted
  after delete
  on org_contact_rel
  for each row
  execute procedure contact_deleted();

-- org_service_del (org_service_rel)
drop function if exists service_deleted() cascade;
create function service_deleted()
  returns trigger
  as $$
    begin
      insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id)
      values(OLD.org_id, OLD.service_id, OLD.added, OLD.note, now(), 275);
    end;
  $$ language plpgsql;

drop trigger if exists service_deleted on org_service_rel;
create trigger service_deleted
  after delete
  on org_service_rel
  for each row
  execute procedure service_deleted();

-- org_del (org)
drop function if exists org_deleted() cascade;
create function org_deleted()
  returns trigger
  as $$
    begin
      insert into org_del(id, org_name_id, update_note, cic_id, updated, service_level)
      values(OLD.id, OLD.org_name_id, OLD.update_note, OLD.cic_id, now(), OLD.service_level);
    end;
  $$ language plpgsql;

drop trigger if exists org_deleted on org;
create trigger org_deleted
  after delete
  on org
  for each row
  execute procedure org_deleted();

-- org_name_del (org_names)
drop function if exists org_name_deleted() cascade;
create function org_name_deleted()
  returns trigger
  as $$
    begin
      insert into org_rel_del(org_id, rel_id, added, deleted, table_id)
      values(OLD.org_id, OLD.org_name_id, now(), now(), 249);
    end;
  $$ language plpgsql;

drop trigger if exists org_name_deleted on org_names;
create trigger org_deleted
  after delete
  on org_names
  for each row
  execute procedure org_name_deleted();

-- update_org_name (org.org_name_id)

-- update_name_parent (tblorgname.ParentID)

-- skipping deleteDeletedPubs

-- org_insert (org)

-- skipping pub_org_del
-- skipping MetaIndex

-- update_name_sort_parent (tblorgname)

-- update_child_sort_key (tblorgname)

-- create_org_name_sort_key (tblorgname)

-- insert_uf (org_thes)

-- orgModNameDel (org_names)

-- delete_uf (org_thes)

-- skipping meta_insert_thes_o
-- skipping meta_insert_thes_o
-- skipping meta_update_thes_o
-- skipping org_meta_insert_res
-- skipping org_meta_delete_res
-- skipping meta_delete_resource
-- skipping meta_insert_resource
-- skipping meta_update_res after

-- orgModContactDel (org_contact_rel)

-- orgModCommIns (org_comm_rel)

-- orgModCommDel (org_comm_rel)

-- orgModAddressDel (org_address_rel)

-- orgModAddressIns (org_address_rel)

-- orgModContactIns (org_contact_rel)

-- orgModServiceUp (tblservice)
drop function if exists service_modified() cascade;
create function service_modified()
  returns trigger
  as $$
    service_id = TD["new"]["id"]
    mods = [(
      "update tblservice "
      "set updated = now() "
      "where id = $1"
    ),
    (
      "select org_modified(o.org_id) "
      "from org_service_rel as o join tblservice as s on o.service_id = s.id "
      "where s.id = $1"
    )]
    for mod in mods:
      plan = plpy.prepare(mod, ["int"])
      results = plpy.execute(plan, [service_id])
  $$ language plpythonu;

drop trigger if exists service_trigger on tblservice;
create trigger service_trigger
  -- excluding tblservice.updated, which gets modified by trigger
  after update of description, eligibility, info, fees, hours, dates, application
  on tblservice
  for each row
  execute procedure service_modified();

-- skipping meta_insert_address

-- orgModNameIns (org_names)

-- skipping org_meta_insert_address
-- skipping org_meta_delete_address

-- orgModThesInsert (org_thes)

-- orgUpdated (org)

-- orgModThesDelete (org_thes)

-- orgModTaxInsert (orgtaxlink)

-- orgModTaxDelete (orgtaxlink)

-- orgModPubContact (pub_org)

-- updateAddressOrgMod (tbladdress)
drop function if exists address_modified() cascade;
create function address_modified()
  returns trigger
  as $$
    address_id = TD["new"]["id"]
    modify = (
      "select org_modified(o.org_id) "
      "from org_address_rel as o join tbladdress as a on o.address_id = a.id "
      "where a.id = $1"
    )
    plan = plpy.prepare(modify, ["int"])
    results = plpy.execute(plan, [address_id])
  $$ language plpythonu;

drop trigger if exists address_trigger on tbladdress;
create trigger address_trigger
  after update on tbladdress
  for each row
  execute procedure address_modified();

-- updateCommOrgMod (tblcomm)
drop function if exists comm_modified() cascade;
create function comm_modified()
  returns trigger
  as $$
    comm_id = TD["new"]["id"]
    modify = (
      "select org_modified(o.org_id) "
      "from org_comm_rel as o join tblcomm as c on o.comm_id = c.id "
      "where c.id = $1"
    )
    plan = plpy.prepare(modify, ["int"])
    results = plpy.execute(plan, [comm_id])
  $$ language plpythonu;

drop trigger if exists comm_trigger on tblcomm;
create trigger comm_trigger
  after update on tblcomm
  for each row
  execute procedure comm_modified();

-- updateContactOrgMod (tblcontact)
drop function if exists contact_modified() cascade;
create function contact_modified()
  returns trigger
  as $$
    contact_id = TD["new"]["id"]
    modify = (
      "select org_modified(o.org_id) "
      "from org_contact_rel as o join tblcontact as c on o.contact_id = c.id "
      "where c.id = $1"
    )
    plan = plpy.prepare(modify, ["int"])
    results = plpy.execute(plan, [contact_id])
  $$ language plpythonu;

drop trigger if exists contact_trigger on tblcontact;
create trigger contact_trigger
  after update on tblcontact
  for each row
  execute procedure contact_modified();

-- deleteIncomplete (org.iscomplete)

-- pubOrgInsert (pub_org)

-- skipping meta_update_address (tbladdress)

-- org_services (ic_site_services)

-- skipping meta_delete_address

-- mod (taxgroups)

-- org_sites (ic_agency_sites)

-- org_services_insert (ic_site_services)

-- org_services_delete (ic_site_services)

-- org_sites_insert (ic_agency_sites)

-- org_sites_delete (ic_agency_sites)

-- org_agency_insert (ic_agencies)

-- org_agency_delete (ic_agencies)

-- org_agency (ic_agencies)

-- skipping org_meta_insert_site
-- skipping org_meta_delete_site
