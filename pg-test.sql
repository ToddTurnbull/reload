set search_path to tempdb;

drop domain if exists tempdb.test_results cascade;
create domain tempdb.test_results as text;

-- triggers

-- org_is_active
\i pg-test-trigger-isactive.sql

-- org_name_updated

-- name_parent_updated

-- org_inserted

-- org_thes_deleted

-- org_updated

-- org_is_complete_updated
\i pg-test-trigger-iscomplete.sql

-- tax_groups_updated

-- org_deleted

