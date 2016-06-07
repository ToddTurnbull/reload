drop schema if exists tempdb cascade;
create schema if not exists tempdb;
set search_path to tempdb;

drop domain if exists tempdb.multiocc cascade;
create domain tempdb.multiocc as text;

\i create-table.sql

\i copy.sql

\i alter-table.sql

\i create-index.sql
\i create-index-search.sql

\i create-function.sql
\i create-function-search.sql

\i create-trigger.sql
\i create-trigger-org-modified.sql
\i create-trigger-org-rel-del.sql
\i create-trigger-tblorgname.sql

\i setval.sql
select set_autoincrement();

select org_name_sort_keys()