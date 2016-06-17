-- find org records associated with a group of pubs defined in pub_tree
select
  org.id,
  min(pub.title),
  pub_tree.parent,
  min(parent_pub.title)
from
  org
  join
  pub_org
  on org.id = pub_org.org_id

  join
  pub
  on pub_org.pub_id = pub.id

  join
  pub_tree
  on pub.id = pub_tree.pub

  join
  pub_tree as parent
  on pub_tree.parent = parent.id and parent.depth = 1

  join
  pub as parent_pub
  on parent.pub = parent_pub.id
where
  pub_tree.depth = 1
group by
  org.id,
  pub_tree.parent;
