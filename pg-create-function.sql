set search_path to tempdb;

drop function if exists test_function(a integer, b integer);
-- create function test_function(a integer, b integer)
--   returns integer
--  as $$
--    return a + b
--  $$ language plpythonu;

drop function if exists htmlStrong(plain text);
create function htmlStrong(plain text)
  returns text
  as $$
    return "<strong>{}</strong>".format(plain)
  $$ language plpythonu;

-- skipping cleanstring

drop function if exists clnstring(dirty text);
create function clnstring(dirty text)
  returns text
  as $$
    lower_case = dirty.lower()
    return lower_case
  $$ language plpythonu;
