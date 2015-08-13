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

donald_names = Person.create([
                              { name: "Bintje Spiers", length: 1.70 },                                 
                              { name: "Brigitte Barduck", length: 1.63 }, 
                              { name: "Frank Zumatra", length: 1.75 }, 
                              { name: "Bill Gaatjes", length: 1.80 },
                              { name: "Katja Schuurspons", length: 1.73 }
                              { name: "René Frogger", length: 1.81 }
                              { name: "Ed de Knoei", length: 1.88 }
                              { name: "Patrick Struifert", length: 1.78 }
                              { name: "Marco Tornado", length: 1.83 }
                              { name: "Jennifer Loopneus", length: 1.66 }
                            ])

Person.all do |p|
  p.measurements.weight = 90
  p.measurements.date = Date.today
end