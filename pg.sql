drop schema if exists tempdb cascade;
create schema if not exists tempdb;
set search_path to tempdb;

drop domain if exists tempdb.multiocc cascade;
create domain tempdb.multiocc as text;

