-- skipping WebTemplate
-- skipping WebData

alter table thes
  add foreign key (cat_id)
  references thes_cat (id);

alter table thes_tree
  add foreign key (parent_id)
  references thes (id);

alter table thes_data
  add foreign key (thes_id)
  references thes (id);

alter table thes_data
  add foreign key (data_id)
  references org (id);

alter table thes_related
  add foreign key (related_id)
  references thes (id);

alter table thes_related
  add foreign key (thes_id)
  references thes (id);

-- skipping blue_entry

alter table thes_reject
  add foreign key (thes_id) 
  references thes (id);

alter table thes_reject
  add foreign key (accept_id) 
  references thes (id);

alter table thes_blue_entry
  add foreign key (thes_id) 
  references thes (id);

alter table thes_blue
  add foreign key (thes_id) 
  references thes (id);

alter table thes_blue_related
  add foreign key (thes_blue_id) 
  references thes (id);

alter table thes_blue_related
  add foreign key (thes_blue_id) 
  references thes_blue (thes_id);

alter table thes_blue_related
  add foreign key (related_id) 
  references thes_blue (thes_id);

alter table thes_blue_related
  add foreign key (related_id) 
  references thes (id);

-- skipping xref

alter table tblAddress
  add foreign key (AddressTypeID) 
  references tlkpAddressType (ID);

alter table trelAddressAccessibility
  add foreign key (AccessibilityID) 
  references tlkpAccessibility (ID);

alter table trelAddressAccessibility
  add foreign key (AddressID) 
  references tblAddress (ID);

alter table tblComm
  add foreign key (CommTypeID) 
  references tlkpCommType (ID);

alter table trelServiceLanguage
  add foreign key (ServiceID) 
  references tblService (ID);

alter table trelServiceLanguage
  add foreign key (LanguageID) 
  references tlkpLanguage (ID);

alter table trelServiceArea
  add foreign key (AreaID) 
  references tlkpArea (ID);

alter table trelServiceArea
  add foreign key (ServiceID) 
  references tblService (ID);

alter table tblOrgName
  add foreign key (OrgNameTypeID) 
  references tlkpOrgNameType (ID);

alter table tblOrgName
  add foreign key (ParentID) 
  references tblOrgName (ID);

alter table meta_index
  add foreign key (column_id) 
  references meta_column (id);

alter table meta_index
  add foreign key (word_id) 
  references meta_word (id);

alter table meta_column_group
  add foreign key (column_id) 
  references meta_column (id);

alter table meta_column_group
  add foreign key (group_id) 
  references meta_group (id);

alter table org_names
  add foreign key (org_name_id) 
  references tblOrgName (ID);

alter table org_names
  add foreign key (org_id) 
  references org (id);

alter table meta_index_thes
  add foreign key (word_id) 
  references meta_word (id);

alter table meta_index_thes
  add foreign key (row_id) 
  references thes (id);

alter table org
  add foreign key (org_name_id) 
  references tblOrgName (ID);

alter table org_meta
  add foreign key (org_id) 
  references org (id);

alter table org_meta
  add foreign key (word_id) 
  references meta_word (id);

alter table org_meta
  add foreign key (column_id) 
  references meta_column (id);

-- skipping settle_thes
-- skipping settle_org

alter table org_comm_rel
  add foreign key (org_id) 
  references org (id);

alter table org_comm_rel
  add foreign key (comm_id) 
  references tblComm (ID);

alter table org_address_rel
  add foreign key (org_id) 
  references org (id);

alter table org_address_rel
  add foreign key (address_id) 
  references tblAddress (ID);

alter table org_contact_rel
  add foreign key (org_id) 
  references org (id);

alter table org_contact_rel
  add foreign key (contact_id) 
  references tblContact (ID);

alter table org_service_rel
  add foreign key (org_id) 
  references org (id);

alter table org_service_rel
  add foreign key (service_id) 
  references tblService (ID);

alter table pub_org
  add foreign key (pub_id) 
  references pub (id);

alter table pub_org
  add foreign key (org_id) 
  references org (id);

alter table pub_org
  add foreign key (org_contact_id) 
  references org_contact_rel (id) on delete set null;

-- skipping res
-- skipping res_order
-- skipping org_res_rel
-- skipping temp_name_2

alter table thes_rel
  add foreign key (rel_id) 
  references thes_original (id);

alter table thes_rel
  add foreign key (ca) 
  references thes_cat (id);

alter table thes_rel
  add foreign key (thes_id) 
  references thes_original (id);

-- skipping temp_insert_rel

alter table org_thes
  add foreign key (org_id) 
  references org (id);

alter table org_thes
  add foreign key (thes_id) 
  references thes_original (id);

alter table org_thes
  add foreign key (official_id) 
  references thes_original (id);

alter table pub_entry
  add foreign key (pub_org_id) 
  references pub_org (id);

alter table area
  add foreign key (locatedIn) 
  references area (id);

-- skipping org_parent_child
-- skipping parent_child_hours

alter table taxonomy
  add foreign key (parentId) 
  references taxonomy (id);

alter table taxRel
  add foreign key (taxID) 
  references taxonomy (id);

alter table taxRel
  add foreign key (relID) 
  references taxonomy (id);

alter table org_tax
  add foreign key (orgID) 
  references org (id);

-- skipping cura
-- skipping curaTargets
-- skipping curaCategory
-- skipping curaCategories
-- skipping tblBroadcast

alter table locations
  add foreign key (locatedIn) 
  references locations (id);

-- skipping log_enq
-- skipping staff

alter table pubGroup
  add foreign key (groupId) 
  references pubGroupName (id);

alter table pubGroup
  add foreign key (pubId) 
  references pub (id);

alter table orgNotes
  add foreign key (orgId) 
  references org (id);

alter table orgNotes
  add foreign key (noteType) 
  references orgNoteTypes (id);

alter table pubThes
  add foreign key (pubId) 
  references pub (id);

alter table pubThes
  add foreign key (thesId) 
  references thes_original (id);

alter table orgMod
  add foreign key (columnId) 
  references orgModColumns (id);

alter table taxGroups
  add foreign key (taxID) 
  references taxonomy (id);

alter table orgUpdated
  add foreign key (orgid) 
  references org (id);

-- skipping postalCodes

alter table taxLink
  add foreign key (taxId) 
  references taxonomy (id);

alter table taxLink
  add foreign key (linkId) 
  references taxLinkNote (id)
  on delete cascade;

alter table orgTaxLink
  add foreign key (orgId) 
  references org (id);

alter table orgTaxLink
  add foreign key (linkId) 
  references taxLinkNote (id)
  on delete cascade;

alter table cioc
  add foreign key (pid) 
  references pub (id);

alter table cioc
  add foreign key (xid) 
  references ciocExport (id);

alter table orgFunding
  add foreign key (orgId) 
  references org (id) on delete cascade;

alter table orgFunding
  add foreign key (fundingId) 
  references funding (id);

alter table isql
  add foreign key (linkID) 
  references isql (id);

alter table org_location
  add foreign key (org_id) 
  references org (id);

alter table org_locations
  add foreign key (location_id) 
  references org_location (id);

alter table org_locations
  add foreign key (address_id) 
  references tblAddress (ID);

alter table pubTax
  add foreign key (taxId) 
  references taxLinkNote (id)
  on delete cascade;

alter table pubTax
  add foreign key (pubId) 
  references pub (id);

alter table ic_agencies
  add foreign key (orgid) 
  references org (id);

alter table ic_agency_sites
  add foreign key (agencyid) 
  references ic_agencies (id);

alter table ic_agency_sites
  add foreign key (siteid) 
  references org (id);

alter table ic_site_services
  add foreign key (siteid) 
  references ic_agency_sites (id);

alter table ic_site_services
  add foreign key (serviceid) 
  references org (id);

alter table pub_tree
  add foreign key (pub) 
  references pub (id);

alter table site
  add foreign key (org_address_id) 
  references org_address_rel (id)
  on delete cascade;

alter table org_tree
  add foreign key (org_id) 
  references org (id);

alter table org_tree
  add foreign key (super_id) 
  references org_tree (id);

alter table org_site
  add foreign key (org_id) 
  references org (id);

alter table org_site
  add foreign key (site_id) 
  references site (id);

alter table org_site_name
  add foreign key (org_site_id) 
  references org_site (id);

alter table org_site_name
  add foreign key (org_names_id) 
  references org_names (id);

alter table org_thes_pub
  add foreign key (org_thes_id) 
  references org_thes (id)
  on delete cascade;

alter table org_thes_pub
  add foreign key (pub_id) 
  references pub (id)
  on delete cascade;

alter table contact_comm
  add foreign key (comm_id) 
  references tblComm (ID);

alter table contact_comm
  add foreign key (contact_id) 
  references tblContact (ID);

alter table external_data
  add foreign key (external_type) 
  references external (id);

