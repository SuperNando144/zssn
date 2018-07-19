# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Survivor.create({
		name: "Fernando",
		age: 22,
		gender: "Masculino",
		ll_latitude: 43.323,
		ll_longitude: 18.323,
		infested: "Nao",
		reports: 0,
		qt_water: 1,
		qt_food: 2,
		qt_medication: 0,
		qt_ammunition: 1
})
Survivor.create({
		name: "Bruno",
		age: 17,
		gender: "Masculino",
		ll_latitude: 44.523,
		ll_longitude: 12.233,
		infested: "Nao",
		reports: 0,
		qt_water: 3,
		qt_food: 0,
		qt_medication: 2,
		qt_ammunition: 3
})
Survivor.create({
		name: "Nicolle",
		age: 15,
		gender: "Feminino",
		ll_latitude: 44.232,
		ll_longitude: 12.232,
		infested: "Nao",
		reports: 0,
		qt_water: 4,
		qt_food: 1,
		qt_medication: 2,
		qt_ammunition: 3
	})