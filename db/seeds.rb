# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
UserFlashcard.destroy_all

Translation.destroy_all
tisch = Translation.create(primary_language_word: "tisch", target_language_word: "table", default: false)
stuhl = Translation.create(primary_language_word: "stuhl", target_language_word: "chair", default: false)
apfel = Translation.create(primary_language_word: "apfel", target_language_word: "apple", default: false)
birne = Translation.create(primary_language_word: "birne", target_language_word: "pear", default: false)
schlüssel = Translation.create(primary_language_word: "schlüssel", target_language_word: "key", default: false)
hund = Translation.create(primary_language_word: "hund", target_language_word: "dog", default: false)

Category.destroy_all
furniture = Category.create(name: "Furniture")
food = Category.create(name: "Food")
animals = Category.create(name: "Animals")
household = Category.create(name: "Household")

User.destroy_all
james = User.create!(user_name: "capten", first_name: "james", last_name: "smith", email: "james@gmail.com", password: "12345678")
cuilu = User.create!(user_name: "lulu", first_name: "cuilu", last_name: "fan", email: "cuilu@example.com", password: "12345678" )
shakar = User.create!(user_name: "False-Legend", first_name: "shakar", last_name: "hassan", email: "shakar@example.com", password: "12345678" )
juan = User.create!(user_name: "juanma", first_name: "juan", last_name: "laborde", email: "juan@gmail.com", password: "12345678" )

Call.create(caller: james, random_user: cuilu, duration: 10)

james.add_friend(cuilu)
james.add_friend(juan)
cuilu.add_friend(juan)
shakar.add_friend(juan)
james.add_friend(shakar)
shakar.add_friend(cuilu)
cuilu.add_friend(shakar)


# UserFlashcard.create(user: james, translation: tisch, category: furniture)
# UserFlashcard.create(user: james, translation: stuhl, category: furniture)
# UserFlashcard.create(user: james, translation: apfel, category: food)
# UserFlashcard.create(user: james, translation: birne, category: food)
# UserFlashcard.create(user: james, translation: hund, category: animals)
