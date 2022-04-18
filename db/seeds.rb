# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

project1 = Project.create(name: "Launch website")
project2 = Project.create(name: "Incorporate startup")

Task.create(name: "Design", project: project1)
Task.create(name: "Develop", project: project1)
Task.create(name: "Launch", project: project1)
Task.create(name: "Choose law firm", project: project2)
Task.create(name: "Choose between LLC & c-corp", project: project2)