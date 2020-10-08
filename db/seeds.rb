# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)
puts "creating ingredients"
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end
Ingredient.create(name: "Coke")
Ingredient.create(name: "Orange peel")
Ingredient.create(name: "Worcestershire")
Ingredient.create(name: "Tabasco")
Ingredient.create(name: "Clamato juice")
Ingredient.create(name: "Campari")
puts "ingredients succsefully created"

martini = Cocktail.create(name: "Martini")
Dose.create(cocktail: martini, ingredient: Ingredient.find_by(name: "Vodka"), description: "3 oz")
Dose.create(cocktail: martini, ingredient: Ingredient.find_by(name: "Dry Vermouth"), description: "0,5 oz")

margarita = Cocktail.create(name: "Margarita")
Dose.create(cocktail: margarita, ingredient: Ingredient.find_by(name: "Tequila"), description: "2 oz")
Dose.create(cocktail: margarita, ingredient: Ingredient.find_by(name: "Triple sec"), description: "1 oz")
Dose.create(cocktail: margarita, ingredient: Ingredient.find_by(name: "Lime juice"), description: "1 oz")

mojito = Cocktail.create(name: "Mojito")
Dose.create(cocktail: mojito, ingredient: Ingredient.find_by(name: "Light rum"), description: "1,5 oz")
Dose.create(cocktail: mojito, ingredient: Ingredient.find_by(name: "Lime juice"), description: "1 oz")
Dose.create(cocktail: mojito, ingredient: Ingredient.find_by(name: "Sugar syrup"), description: "0,5 oz")
Dose.create(cocktail: mojito, ingredient: Ingredient.find_by(name: "Carbonated water"), description: "top up the glass")

old_fashioned = Cocktail.create(name: "Old fashioned")
Dose.create(cocktail: old_fashioned, ingredient: Ingredient.find_by(name: "Bourbon"), description: "1,5 oz")
Dose.create(cocktail: old_fashioned, ingredient: Ingredient.find_by(name: "Bitters"), description: "2-3 dashes")
Dose.create(cocktail: old_fashioned, ingredient: Ingredient.find_by(name: "Sugar"), description: "1 cube")
Dose.create(cocktail: old_fashioned, ingredient: Ingredient.find_by(name: "Orange peel"), description: "garnish")

caesar = Cocktail.create(name: "Caesar")
Dose.create(cocktail: caesar, ingredient: Ingredient.find_by(name: "Vodka"), description: "2 oz")
Dose.create(cocktail: caesar, ingredient: Ingredient.find_by(name: "Clamato juice"), description: "top up the glass")
Dose.create(cocktail: caesar, ingredient: Ingredient.find_by(name: "Worcestershire"), description: "2-3 dashes")
Dose.create(cocktail: caesar, ingredient: Ingredient.find_by(name: "Tabasco"), description: "2-3 dashes")

negroni = Cocktail.create(name: "Negroni")
Dose.create(cocktail: negroni, ingredient: Ingredient.find_by(name: "Gin"), description: "1 oz")
Dose.create(cocktail: negroni, ingredient: Ingredient.find_by(name: "Sweet Vermouth"), description: "1 oz")
Dose.create(cocktail: negroni, ingredient: Ingredient.find_by(name: "Campari"), description: "1 oz")

daiquiri = Cocktail.create(name: "Daiquiri")
Dose.create(cocktail: daiquiri, ingredient: Ingredient.find_by(name: "Light rum"), description: "1,5 oz")
Dose.create(cocktail: daiquiri, ingredient: Ingredient.find_by(name: "Lime juice"), description: "1 oz")
Dose.create(cocktail: daiquiri, ingredient: Ingredient.find_by(name: "Sugar syrup"), description: "0,5 oz")

cuba_libre = Cocktail.create(name: "Cuba libre")
Dose.create(cocktail: cuba_libre, ingredient: Ingredient.find_by(name: "Light rum"), description: "1,5 oz")
Dose.create(cocktail: cuba_libre, ingredient: Ingredient.find_by(name: "Lime juice"), description: "0,5 oz")
Dose.create(cocktail: cuba_libre, ingredient: Ingredient.find_by(name: "Coke"), description: "4 oz")

sidecar = Cocktail.create(name: "Sidecar")
Dose.create(cocktail: sidecar, ingredient: Ingredient.find_by(name: "Cognac"), description: "2 oz")
Dose.create(cocktail: sidecar, ingredient: Ingredient.find_by(name: "Triple sec"), description: "3/4 oz")
Dose.create(cocktail: sidecar, ingredient: Ingredient.find_by(name: "Lemon juice"), description: "3/4 oz")

boulevardier = Cocktail.create(name: "Boulevardier")
Dose.create(cocktail: boulevardier, ingredient: Ingredient.find_by(name: "Whiskey"), description: "1 oz")
Dose.create(cocktail: boulevardier, ingredient: Ingredient.find_by(name: "Campari"), description: "1 oz")
Dose.create(cocktail: sidecar, ingredient: Ingredient.find_by(name: "Sweet Vermouth"), description: "1 oz")

whiskey_sour = Cocktail.create(name: "Whiskey sour")
Dose.create(cocktail: whiskey_sour, ingredient: Ingredient.find_by(name: "Bourbon"), description: "1,5 oz")
Dose.create(cocktail: whiskey_sour, ingredient: Ingredient.find_by(name: "Lemon juice"), description: "1 oz")
Dose.create(cocktail: whiskey_sour, ingredient: Ingredient.find_by(name: "Bitters"), description: "2-3 dashes")
Dose.create(cocktail: whiskey_sour, ingredient: Ingredient.find_by(name: "Egg"), description: "1 oz of egg whites")

espresso_martini = Cocktail.create(name: "Espresso martini")
Dose.create(cocktail: espresso_martini, ingredient: Ingredient.find_by(name: "Vodka"), description: "1,5 oz")
Dose.create(cocktail: espresso_martini, ingredient: Ingredient.find_by(name: "Kahlua"), description: "1 oz")
Dose.create(cocktail: espresso_martini, ingredient: Ingredient.find_by(name: "Espresso"), description: "1 shot")

tom_collins = Cocktail.create(name: "Tom collins")
Dose.create(cocktail: tom_collins, ingredient: Ingredient.find_by(name: "Gin"), description: "1,5 oz")
Dose.create(cocktail: tom_collins, ingredient: Ingredient.find_by(name: "Lemon juice"), description: "1 oz")
Dose.create(cocktail: tom_collins, ingredient: Ingredient.find_by(name: "Carbonated water"), description: "top up the glass")








