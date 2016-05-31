set search_path to tempdb;

drop function if exists htmlStrong(plain text);
create function htmlStrong(plain text)
  returns text
  as $$
    plpy.notice("I am htmlStrong()")
    return "<strong>{}</strong>".format(plain)
  $$ language plpythonu;

-- skipping cleanstring

drop function if exists clnstring(dirty text);
create function clnstring(dirty text)
  returns text
  as $$
    plpy.notice("I am clnstring()")
    import re
    lower_case = dirty.lower()
    clean = re.sub('[\W_]+', ' ', lower_case)
    return clean
  $$ language plpythonu;

-- skipping url_googlemap
-- skipping edb_f_org
-- skipping edb_toll_free
-- skipping blue_comm_type
-- skipping cic_contact

drop function if exists org_name_full(org_id integer);
create function org_name_full(org_id integer)
  returns text
  as $$
    plpy.notice("I am org_name_full()")
    select = (
      "select name "
      "from tblorgname join org_names on tblorgname.id = org_names.org_name_id "
      "where tblorgname.orgnametypeid = 1 and org_names.org_id = $1 "
      "order by tblorgname.level"
    )
    plan = plpy.prepare(select, ["int"])
    results = plpy.execute(plan, [org_id])
    return ", ".join([r["name"] for r in results])
  $$ language plpythonu;

drop function if exists url_escape(param text);
create function url_escape(param text)
    returns text
    as $$
      plpy.notice("I am url_escape()")
      import urllib
      return urllib.quote(param)
    $$ language plpythonu;

-- skipping edb_thes
-- skipping edb_uf
-- skipping edb_alt_org
-- skipping apt_alt_org
-- skipping edb_comm
-- skipping edb_multi_generic
-- skipping pub_comm
-- skipping edb_multi_occ
-- skipping pub_contact
-- skipping edb_settle_uf
-- skipping cic_comm
-- skipping wp_comm
-- skipping wp_alt_org
-- skipping bluComm
-- skipping bluCommLabel
-- skipping edb_settle_thes
-- skipping blue_comm
-- skipping htmlSmall
-- skipping url_mapquest
-- skipping urlSearchId
-- skipping orgNoteEnquiry
-- skipping cicCommHtml
-- skipping urlOrgName
-- skipping cit_comm

drop function if exists addressStr(address_id integer);
create function addressStr(address_id integer)
  returns text
  as $$
    plpy.notice("I am addressStr()")
    select = "select * from tbladdress where id = $1"
    plan = plpy.prepare(select, ["integer"])
    results = plpy.execute(plan, [address_id])
    if results:
      address = results[0]
      result = []
      if address["unitvalue"]:
        if not address["unit"]:
          result.append("{}-".format(address["unitvalue"]))
      if address["streetnumber"]:
        result.append("{} ".format(address["streetnumber"]))
      if address["address"]:
        result.append(address["address"])
      if address["streetsuffix"]:
        result.append(" {}".format(address["streetsuffix"]))
      if address["streetdirection"]:
        result.append(" {}".format(address["streetdirection"]))
      if address["unit"]:
        result.append(", {} {}".format(address["unit"], address["unitvalue"]))
      if address["unitextra"]:
        result.append(", {}".format(address["unitextra"]))
      if address["deliverymode"]:
        if address["address"]:
          result.append(", ")
        result.append("{} {}".format(address["deliverymode"], address["deliverynumber"]))
        if address["deliverystation"]:
          result.append(" {}".format(address["deliverystation"]))
      return "".join(result)
    else:
      return None
  $$ language plpythonu;

-- skipping commStr
-- skipping replaceStringOutput
-- skipping lineBreaksToHTML
-- skipping cic_commTest
-- skipping htmlP
-- skipping orgDisplayContact
-- skipping orgDisplayService
-- skipping mapStr
-- skipping orgNote
-- skipping cic_commTest2
-- skipping cic_contact2
-- skipping streetStr
-- skipping ccComm
-- skipping countPattern
-- skipping locations_text
-- skipping zeroNull
-- skipping xmlcsshead
-- skipping cic_contact3
-- skipping addressForGoogle
-- skipping taxBranch
-- skipping url_googlemap2
