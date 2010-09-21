#migrations
DB.create_table :temp do
  primary_key :id
  String :entry
end

DB.create_table :document do
  primary_key :id
  String :master
  String :title
end
