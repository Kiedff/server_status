# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.delete_all
User.delete_all
Event.delete_all

User.create!(email: "admin@email.example", password: "password")

Status.create!(name: "Critical", colour: "#ff0000", resolved: false)
Status.create!(name: "Minor Issue", colour: "#FFC200", resolved: false)
Status.create!(name: "All OK", colour: "#24A243", resolved: true)