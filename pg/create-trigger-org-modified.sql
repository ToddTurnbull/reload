-- call org_modified() when related tables change: tblcomm, org_comm_rel, etc
drop type if exists org_modified cascade;
create type org_modified as (org_id integer, modified timestamp);

-- dropping org_modified type cascades to org_modified() function
drop function if exists org_modified(org_id integer);
create function org_modified(org_id integer)
  returns org_modified
  as $$
    begin
      update org
      set modified = now()
      where id = $1
      returning id, modified;
    end;
  $$ language plpgsql;


-- orgModAddressDel (org_address_rel)
drop function if exists org_address_deleted() cascade;
create function org_address_deleted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from org_address_rel
      where id = OLD.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_address_deleted on org_address_rel;
create trigger org_address_deleted
  after delete
  on org_address_rel
  for each row
  execute procedure org_address_deleted();


-- orgModAddressIns (org_address_rel)
drop function if exists org_address_inserted() cascade;
create function org_address_inserted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from org_address_rel
      where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_address_inserted on org_address_rel;
create trigger org_address_inserted
  after delete
  on org_address_rel
  for each row
  execute procedure org_address_inserted();


-- updateAddressOrgMod (tbladdress)
drop function if exists address_updated() cascade;
create function address_updated()
  returns trigger
  as $$
    plpy.notice("I am address_updated()")
    address_id = TD["new"]["id"]
    modify = (
      "select org_modified(o.org_id) "
      "from org_address_rel as o join tbladdress as a on o.address_id = a.id "
      "where a.id = $1"
    )
    plan = plpy.prepare(modify, ["int"])
    results = plpy.execute(plan, [address_id])
  $$ language plpythonu;

drop trigger if exists address_updated on tbladdress;
create trigger address_updated
  after update on tbladdress
  for each row
  execute procedure address_updated();


-- updateCommOrgMod (tblcomm)
drop function if exists comm_updated() cascade;
create function comm_updated()
  returns trigger
  as $$
    plpy.notice("I am comm_updated()")
    comm_id = TD["new"]["id"]
    modify = (
      "select org_modified(o.org_id) "
      "from org_comm_rel as o join tblcomm as c on o.comm_id = c.id "
      "where c.id = $1"
    )
    plan = plpy.prepare(modify, ["int"])
    results = plpy.execute(plan, [comm_id])
  $$ language plpythonu;

drop trigger if exists comm_updated on tblcomm;
create trigger comm_updated
  after update on tblcomm
  for each row
  execute procedure comm_updated();


-- updateContactOrgMod (tblcontact)
drop function if exists contact_updated() cascade;
create function contact_updated()
  returns trigger
  as $$
    plpy.notice("I am contact_updated()")
    contact_id = TD["new"]["id"]
    modify = (
      "select org_modified(o.org_id) "
      "from org_contact_rel as o join tblcontact as c on o.contact_id = c.id "
      "where c.id = $1"
    )
    plan = plpy.prepare(modify, ["int"])
    results = plpy.execute(plan, [contact_id])
  $$ language plpythonu;

drop trigger if exists contact_updated on tblcontact;
create trigger contact_updated
  after update on tblcontact
  for each row
  execute procedure contact_updated();


-- org_agency_delete (ic_agencies)
drop function if exists ic_agency_deleted() cascade;
create function ic_agency_deleted()
  returns trigger
  as $$
    begin
      select org_modified(OLD.orgid);
      update org
        set modified = now()
        where id = any(
          select siteid
          from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
          where orgid in (OLD.orgid)
        );
      update org
        set modified = now()
        where id = any(
          select serviceid
          from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
          where orgid in (OLD.orgid)
        );
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_agency_deleted on ic_agencies;
create trigger ic_agency_deleted
  after delete
  on ic_agencies
  for each row
  execute procedure ic_agency_deleted();


-- org_agency_insert (ic_agencies)
drop function if exists ic_agency_inserted() cascade;
create function ic_agency_inserted()
  returns trigger
  as $$
    begin
      select org_modified(NEW.orgid);
      update org
        set modified = now()
        where id = any(
          select siteid
          from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
          where orgid in (NEW.orgid));
      update org
        set modified = now()
        where id = any(
          select serviceid
          from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
          where orgid in (NEW.orgid)
        );
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_agency_inserted on ic_agencies;
create trigger ic_agency_inserted
  after insert
  on ic_agencies
  for each row
  execute procedure ic_agency_inserted();


-- org_agency (ic_agencies)
drop function if exists ic_agency_updated() cascade;
create function ic_agency_updated()
  returns trigger
  as $$
    begin
      select org_modified(OLD.orgid);
      select org_modified(NEW.orgid);
      update org
       set modified = now()
       where id = any(
        select siteid from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
        where orgid in (OLD.orgid, NEW.orgid)
      );
      update org
        set modified = now() 
        where id = any(
          select serviceid
          from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
          where orgid in (OLD.orgid, NEW.orgid)
        );
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_agency_updated on ic_agencies;
create trigger ic_agency_updated
  after update
  on ic_agencies
  for each row
  execute procedure ic_agency_updated();


-- org_sites_delete (ic_agency_sites)
drop function if exists ic_sites_deleted() cascade;
create function ic_sites_deleted()
  returns trigger
  as $$
    begin
      select org_modified(OLD.siteid);
      update org
        set modified = now()
        where id = any(
          select orgid
          from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
          where siteid in (OLD.siteid)
        );
      update org
        set modified = now()
        where id = any(
          select serviceid
          from ic_site_services
          where siteid in (OLD.siteid)
        );
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_sites_deleted on ic_agency_sites;
create trigger ic_sites_deleted
  after delete
  on ic_agency_sites
  for each row
  execute procedure ic_sites_deleted();


-- org_sites_insert (ic_agency_sites)
drop function if exists ic_sites_inserted() cascade;
create function ic_sites_inserted()
  returns trigger
  as $$
    begin
      select org_modified(NEW.siteid);
      update org
        set modified = now()
        where id = any(
          select orgid
          from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
          where siteid in (NEW.siteid)
        );
      update org 
        set modified = now()
        where id = any(
          select serviceid
          from ic_site_services
          where siteid in (NEW.siteid)
        );
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_sites_inserted on ic_agency_sites;
create trigger ic_sites_inserted
  after insert
  on ic_agency_sites
  for each row
  execute procedure ic_sites_inserted();


-- org_sites (ic_agency_sites)
drop function if exists ic_sites_updated() cascade;
create function ic_sites_updated()
  returns trigger
  as $$
    begin
      select org_modified(OLD.siteid);
      select org_modified(NEW.siteid);
      update org
      set modified = now()
      where id = any(
        select orgid
        from ic_agencies join ic_agency_sites on ic_agencies.id = ic_agency_sites.agencyid
        where siteid in (OLD.siteid, NEW.siteid)
      );
      update org
      set modified = now()
      where id = any(
        select serviceid
        from ic_site_services
        where siteid in (OLD.siteid, NEW.siteid)
      );
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_sites_updated on ic_agency_sites;
create trigger ic_sites_updated
  after update
  on ic_agency_sites
  for each row
  execute procedure ic_sites_updated();


-- org_services_delete (ic_site_services)
drop function if exists ic_services_deleted() cascade;
create function ic_services_deleted()
  returns trigger
  as $$
    begin
      select org_modified(OLD.serviceid);
      update org
        set modified = now()
        where id = any(
          select ic_agency_sites.siteid
          from ic_agency_sites join ic_site_services on ic_agency_sites.id = ic_site_services.siteid
          where serviceid in (OLD.serviceid));
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_services_deleted on ic_site_services;
create trigger ic_services_deleted
  after delete
  on ic_site_services
  for each row
  execute procedure ic_services_deleted();


-- org_services_insert (ic_site_services)
drop function if exists ic_services_inserted() cascade;
create function ic_services_inserted()
  returns trigger
  as $$
    begin
      select org_modified(NEW.serviceid);
      update org
        set modified = now()
        where id = any(
          select ic_agency_sites.siteid
          from ic_agency_sites join ic_site_services on ic_agency_sites.id = ic_site_services.siteid
          where serviceid in (NEW.serviceid)
        );
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_services_inserted on ic_site_services;
create trigger ic_services_inserted
  after insert
  on ic_site_services
  for each row
  execute procedure ic_services_inserted();


-- org_services (ic_site_services)
drop function if exists ic_services_updated() cascade;
create function ic_services_updated()
  returns trigger
  as $$
    begin
      select org_modified(OLD.serviceid);
      select org_modified(NEW.serviceid);
      update org
      set modified = now()
      where id = any(
        select ic_agency_sites.siteid
        from ic_agency_sites join ic_site_services on ic_agency_sites.id = ic_site_services.siteid
        where serviceid in(OLD.serviceid, NEW.serviceid)
      );
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists ic_services_updated on ic_site_services;
create trigger ic_services_updated
  after update
  on ic_site_services
  for each row
  execute procedure ic_services_updated();


-- orgModCommDel (org_comm_rel)
drop function if exists org_comm_deleted() cascade;
create function org_comm_deleted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from org_comm_rel
      where id = OLD.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_comm_deleted on org_comm_rel;
create trigger org_comm_deleted
  after delete
  on org_comm_rel
  for each row
  execute procedure org_comm_deleted();


-- orgModCommIns (org_comm_rel)
drop function if exists org_comm_inserted() cascade;
create function org_comm_inserted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from org_comm_rel
      where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_comm_inserted on org_comm_rel;
create trigger org_comm_inserted
  after insert
  on org_comm_rel
  for each row
  execute procedure org_comm_inserted();


-- orgModContactDel (org_contact_rel)
drop function if exists org_contact_deleted() cascade;
create function org_contact_deleted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from org_contact_rel
      where id = OLD.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_contact_deleted on org_contact_rel;
create trigger org_contact_deleted
  after delete
  on org_contact_rel
  for each row
  execute procedure org_contact_deleted();


-- orgModContactIns (org_contact_rel)
drop function if exists org_contact_inserted() cascade;
create function org_contact_inserted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from org_contact_rel
      where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_contact_inserted on org_contact_rel;
create trigger org_contact_inserted
  after insert
  on org_contact_rel
  for each row
  execute procedure org_contact_inserted();


-- orgModNameDel (org_names)
drop function if exists org_names_deleted() cascade;
create function org_names_deleted()
  returns trigger
  as $$
    begin
      if OLD.org_name_id = any(select id from tblorgname where  orgnametypeid != 1) then
        perform org_modified(OLD.org_id);
      end if;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_names_deleted on org_names;
create trigger org_names_deleted
  after delete
  on org_names
  for each row
  execute procedure org_names_deleted();


-- orgModNameIns (org_names)
drop function if exists org_names_inserted() cascade;
create function org_names_inserted()
  returns trigger
  as $$
    begin
      if NEW.org_name_id = any(select id from tblorgname where  orgnametypeid != 1) then
        select org_modified(NEW.org_id);
      end if;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_names_inserted on org_names;
create trigger org_names_inserted
  after insert
  on org_names
  for each row
  execute procedure org_names_inserted();


-- orgModTaxInsert (orgtaxlink)
drop function if exists org_tax_inserted() cascade;
create function org_tax_inserted()
  returns trigger
  as $$
    begin
      select org_modified(orgid)
      from orgtaxlink
      where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_tax_inserted on orgtaxlink;
create trigger org_tax_inserted
  after insert
  on orgtaxlink
  for each row
  execute procedure org_tax_inserted();


-- orgModTaxDelete (orgtaxlink)
drop function if exists org_tax_deleted() cascade;
create function org_tax_deleted()
  returns trigger
  as $$
    begin
      select org_modified(orgid)
      from orgtaxlink
      where id = OLD.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_tax_deleted on orgtaxlink;
create trigger org_tax_deleted
  after delete
  on orgtaxlink
  for each row
  execute procedure org_tax_deleted();


-- orgModThesDelete (org_thes)
drop function if exists org_thes_deleted() cascade;
create function org_thes_deleted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from org_thes
      where id = OLD.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_thes_deleted on org_thes;
create trigger org_thes_deleted
  after delete
  on org_thes
  for each row
  execute procedure org_thes_deleted();


-- orgModThesInsert (org_thes)
drop function if exists org_thes_inserted() cascade;
create function org_thes_inserted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from org_thes
      where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_thes_inserted on org_thes;
create trigger org_thes_inserted
  after insert
  on org_thes
  for each row
  execute procedure org_thes_inserted();


-- pubOrgInsert (pub_org)
drop function if exists pub_org_inserted() cascade;
create function pub_org_inserted()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from pub_org
      where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists pub_org_inserted on pub_org;
create trigger pub_org_inserted
  after insert
  on pub_org
  for each row
  execute procedure pub_org_inserted();


-- orgModPubContact (pub_org)
drop function if exists pub_org_updated() cascade;
create function pub_org_updated()
  returns trigger
  as $$
    begin
      select org_modified(org_id)
      from pub_org
      where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists pub_org_updated on pub_org;
create trigger pub_org_updated
  after update of org_contact_id, isActive
  on pub_org
  for each row
  execute procedure pub_org_updated();


-- orgModServiceUp (tblservice)
drop function if exists service_updated() cascade;
create function service_updated()
  returns trigger
  as $$
    plpy.notice("I am service_updated()")
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

drop trigger if exists service_updated on tblservice;
create trigger service_updated
  -- excluding tblservice.updated, which gets modified by trigger
  after update of description, eligibility, info, fees, hours, dates, application
  on tblservice
  for each row
  execute procedure service_updated();


