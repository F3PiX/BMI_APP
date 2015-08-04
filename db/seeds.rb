# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create(name: "Hans de Vries", length: 1.98)
Person.create(name: "Mozes Kriebel", length: 1.80)
Person.create(name: "Lois Lane", length: 1.75)

Person.all do |p|
  p.measurements.weight = 90
  p.measurements.date = Date.today
end