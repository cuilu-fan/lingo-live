# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Translation.destroy_all
Translation.create(primary_language_word: "tisch", target_language_word: "table", default: false)
Translation.create(primary_language_word: "apfel", target_language_word: "apple", default: false)
Translation.create(primary_language_word: "schüssel", target_language_word: "key", default: false)
Translation.create(primary_language_word: "hund", target_language_word: "dog", default: false)
