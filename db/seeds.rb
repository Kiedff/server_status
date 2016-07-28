# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.delete_all

Status.create!(name: "Critical", colour: "#ff0000", resolved: false)
Status.create!(name: "Minor Issue", colour: "#FFC200")
Status.create!(name: "All OK", colour: "#24A243")