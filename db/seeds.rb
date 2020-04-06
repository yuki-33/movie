# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'nkf'
POSTGRES_TABLES = [
  :tags
]
POSTGRES_TABLES.each do |table_name|
  next unless ActiveRecord::Base.connection.execute("select * from #{table_name};").num_tuples.zero?
  path = File.expand_path("../data/#{table_name}.csv", __FILE__)
  handle = CSV.open path, 'rb', headers: true, encoding: "utf-8:utf-8"
  header = nil
  rows = []
  while row = handle.gets do
    header ||= row.to_h.keys.join(', ')
    rows << "(#{row.to_h.values.map{ |value| value.nil? ? 'NULL' : (value.match(/^[0-9]+$/) ? value : "\'#{ActiveRecord::Base.connection.quote_string(value)}\'") }.join(', ')})"
  end
  handle.close
  if header
    ActiveRecord::Base.connection.execute("INSERT INTO #{table_name} (#{header}) VALUES #{rows.join(', ')};")
    ActiveRecord::Base.connection.execute("select setval('#{table_name}_id_seq',(select max(id) from #{table_name}));")
  end
end
