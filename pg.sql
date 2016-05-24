drop schema if exists tempdb cascade;
create schema if not exists tempdb;
set search_path to tempdb;

drop domain if exists tempdb.multiocc cascade;
create domain tempdb.multiocc as text;

\i pg-create-table.sql

\i pg-copy.sql

\i pg-alter-table.sql

\i pg-create-index.sql

\i pg-create-trigger.sql

\i pg-setval.sql
