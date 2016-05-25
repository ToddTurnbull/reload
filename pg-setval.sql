-- set sequences for autoincrement to max(id)

set search_path to tempdb;

drop function if exists set_autoincrement();
create function set_autoincrement()
  returns void
  as $$
    serial_keys = [
      ("thes", "id"),
      ("thes_cat", "id"),
      ("thes_tree", "id"),
      ("city", "id"),
      ("pub", "id"),
      ("tlkpaddresstype", "id"),
      ("tbladdress", "id"),
      ("tlkpaccessibility", "id"),
      ("treladdressaccessibility", "addressid"),
      ("tlkpcommtype", "id"),
      ("tblcomm", "id"),
      ("tblcontact", "id"),
      ("tblservice", "id"),
      ("tlkplanguage", "id"),
      ("trelservicelanguage", "serviceid"),
      ("tlkparea", "id"),
      ("tblorgname", "id"),
      ("tlkporgnametype", "id"),
      ("org_names", "id"),
      ("org", "id"),
      ("org_comm_rel", "id"),
      ("org_address_rel", "id"),
      ("org_contact_rel", "id"),
      ("org_rel_del", "id"),
      ("org_service_rel", "id"),
      ("org_del", "id"),
      ("pub_org", "id"),
      ("thes_original", "id"),
      ("thes_rel", "id"),
      ("org_thes", "id"),
      ("pub_entry", "id"),
      ("area", "id"),
      ("taxonomy", "id"),
      ("taxRel", "id"),
      ("locations", "id"),
      ("pubGroupName", "id"),
      ("pubGroup", "id"),
      ("orgNotes", "id"),
      ("orgNoteTypes", "id"),
      ("pubThes", "id"),
      ("taxgroups", "id"),
      ("orgUpdated", "id"),
      ("taxLink", "id"),
      ("orgTaxLink", "id"),
      ("taxLinkNote", "id"),
      ("cioc", "id"),
      ("ciocExport", "id"),
      ("taxRelTemp", "id"),
      ("pubTax", "id"),
      ("ic_agencies", "id"),
      ("ic_agency_sites", "id"),
      ("ic_site_services", "id"),
      ("site", "id"),
      ("org_tree", "id"),
      ("org_site", "id"),
      ("org_site_name", "id"),
      ("org_thes_pub", "id"),
      ("contact_comm", "id"),
      ("external", "id"),
      ("external_data", "id")
    ]
    for sequence in serial_keys:
      setval = """select pg_catalog.setval(
        pg_get_serial_sequence('{0}', '{1}'),
        (select max({1}) from {0})
      )""".format(*sequence)
      plpy.notice(setval)
      plan = plpy.prepare(setval)
      result = plpy.execute(plan)
  $$ language plpythonu;

select set_autoincrement();