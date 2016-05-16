-- skipping Data
-- skipping WebTemplate
-- skipping WebData

create index thes_term_index on thes (
  term
);

create index pub_title_index on pub (
  title
);

create index tblcomm_value_index on tblComm (
  Value
);

create index tblcontact_contacttype_index on tblContact (
  ContactType
);

create index tblorgname_sort_index on tblOrgName (
  Sort
);

create index tblorgname_name_index on tblOrgName (
  Name
);

create index tblorgname_sort_key_index on tblOrgName (
  sort_key
);

create index meta_index_column_id_row_id_index on meta_index (
  column_id,
  row_id
);

create index meta_index_word_id_id_index on meta_index (
  word_id,
  id
);

create index org_names_org_name_id_index on org_names (
  org_name_id
);

create index org_names_org_id_index on org_names (
  org_id
);

create index org_names_org_name_id_org_id_index on org_names (
  org_name_id,
  org_id
);

create index meta_index_thes_word_id_row_id_index on meta_index_thes (
  word_id,
  row_id
);

create index meta_index_thes_row_id_word_id_index on meta_index_thes (
  row_id,
  word_id
);

create index meta_index_thes_word_id_index on meta_index_thes (
  word_id
);

create index meta_index_thes_row_id_index on meta_index_thes (
  row_id
);

create index org_created_index on org (
  created
);

create index org_isactive_index on org (
  isactive
);

create index org_iscomplete_index on org (
  iscomplete
);

create index org_meta_word_id_column_id_org_id_index on org_meta (
  word_id,
  column_id,
  org_id
);

create index org_meta_word_id_org_id_column_id_index on org_meta (
  word_id,
  org_id,
  column_id
);

-- skipping res_loc
-- skipping res
-- skipping temp_name_2

create index thes_rel_rel_type_index on thes_rel (
  rel_type
);

create index pub_entry_pub_year_entry_index on pub_entry (
  pub_year,
  entry
);

create index taxonomy_original_termcode_index on taxonomy_original (
  termCode
);

create index taxonomy_name_index on taxonomy (
  name
);

create index taxonomy_modified_index on taxonomy (
  modified
);

-- skipping tempCIT
-- skipping tempGeo

create index taxtemp_code_index on taxTemp (
  code
);

create index taxtemp_parentcode_index on taxTemp (
  parentCode
);

create index taxtemp_modified_index on taxTemp (
  modified
);

create index taxtemp_ispreferred_index on taxTemp (
  isPreferred
);

create index taxtempoldcode_code_index on taxTempOldCode (
  code
);

create index taxtempoldcode_oldcode_index on taxTempOldCode (
  oldCode
);

create index temptaxnames_code_index on tempTaxNames (
  code
);

create index temptaxalso_code_index on tempTaxAlso (
  code
);

create index temptaxalso_see_index on tempTaxAlso (
  see
);

create index temptaxold_code_index on tempTaxOld (
  code
);

create index temptaxold_old_index on tempTaxOld (
  old
);

create index temptaxdetails_code_index on tempTaxDetails (
  code
);

create index pub_tree_parent_index on pub_tree (
  parent
);

create index pub_tree_pub_index on pub_tree (
  pub
);

create index pub_tree_id_index on pub_tree (
  id
);
