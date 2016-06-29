-- track deletions with org_rel_del table
-- org_address_del (org_address_rel)
drop function if exists address_deleted() cascade;
create function address_deleted()
  returns trigger
  as $$
    begin
      insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id)
      values(OLD.org_id, OLD.address_id, OLD.added, OLD.note, now(), 271);
      return null;
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
      return null;
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
      return null;
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
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists service_deleted on org_service_rel;
create trigger service_deleted
  after delete
  on org_service_rel
  for each row
  execute procedure service_deleted();


-- org_name_del (org_names)
drop function if exists org_name_deleted() cascade;
create function org_name_deleted()
  returns trigger
  as $$
    begin
      insert into org_rel_del(org_id, rel_id, added, deleted, table_id)
      values(OLD.org_id, OLD.org_name_id, now(), now(), 249);
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_name_deleted on org_names;
create trigger org_name_deleted
  after delete
  on org_names
  for each row
  execute procedure org_name_deleted();


