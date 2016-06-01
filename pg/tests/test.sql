set search_path to tempdb;

drop domain if exists tempdb.test_results cascade;
create domain tempdb.test_results as text;

-- triggers

-- org_is_active
\i trigger-isactive.sql

-- org_name_updated
\i trigger-org-name-update.sql

-- name_parent_updated
\i trigger-name-parent-updated.sql

-- org_inserted
\i trigger-org-inserted.sql

-- org_thes_inserted

-- org_thes_deleted

-- org_updated

-- org_is_complete_updated
\i trigger-iscomplete.sql

-- tax_groups_updated

-- org_deleted

