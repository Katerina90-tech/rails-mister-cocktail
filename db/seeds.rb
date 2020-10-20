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
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

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
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168373/stanislav-ivanitskiy-VIYPN3KykEU-unsplash_mhykeh.jpg')
martini.photos.attach(io: file, filename: 'martini.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603160020/johann-trasch-zgafuQAe8m0-unsplash_sjdzrj.jpg')
martini.photos.attach(io: file2, filename: 'martini2.jpeg', content_type: 'image/jpeg')

margarita = Cocktail.create(name: "Margarita")
Dose.create(cocktail: margarita, ingredient: Ingredient.find_by(name: "Tequila"), description: "2 oz")
Dose.create(cocktail: margarita, ingredient: Ingredient.find_by(name: "Triple sec"), description: "1 oz")
Dose.create(cocktail: margarita, ingredient: Ingredient.find_by(name: "Lime juice"), description: "1 oz")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168342/edward-howell-5tf40DJYvBM-unsplash_m8epys.jpg')
margarita.photos.attach(io: file, filename: 'margarita.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603164990/16_01_144_FrozenMargarita_Final_4x3_gfohxo.jpg')
margarita.photos.attach(io: file2, filename: 'margarita2.jpeg', content_type: 'image/jpeg')

mojito = Cocktail.create(name: "Mojito")
Dose.create(cocktail: mojito, ingredient: Ingredient.find_by(name: "Light rum"), description: "1,5 oz")
Dose.create(cocktail: mojito, ingredient: Ingredient.find_by(name: "Lime juice"), description: "1 oz")
Dose.create(cocktail: mojito, ingredient: Ingredient.find_by(name: "Sugar syrup"), description: "0,5 oz")
Dose.create(cocktail: mojito, ingredient: Ingredient.find_by(name: "Carbonated water"), description: "top up the glass")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168348/jennifer-schmidt-yrNg91a3Opk-unsplash_xfs0nh.jpg')
mojito.photos.attach(io: file, filename: 'mojito.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603160019/alex-block-eicoRD590x4-unsplash_icpnaj.jpg')
mojito.photos.attach(io: file2, filename: 'mojito2.jpeg', content_type: 'image/jpeg')

old_fashioned = Cocktail.create(name: "Old fashioned")
Dose.create(cocktail: old_fashioned, ingredient: Ingredient.find_by(name: "Bourbon"), description: "1,5 oz")
Dose.create(cocktail: old_fashioned, ingredient: Ingredient.find_by(name: "Bitters"), description: "2-3 dashes")
Dose.create(cocktail: old_fashioned, ingredient: Ingredient.find_by(name: "Sugar"), description: "1 cube")
Dose.create(cocktail: old_fashioned, ingredient: Ingredient.find_by(name: "Orange peel"), description: "garnish")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603165076/Monkey-Shoulder-Lazy-Old-Fashioned-Cocktail-Recipe-735x551_wgfnng.jpg')
old_fashioned.photos.attach(io: file, filename: 'old_fashioned.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603165818/knobcreek_oldfashioned_beauty_7832-4868-Edit_xkb7vb.jpg')
old_fashioned.photos.attach(io: file2, filename: 'old_fashioned2.jpeg', content_type: 'image/jpeg')


caesar = Cocktail.create(name: "Caesar")
Dose.create(cocktail: caesar, ingredient: Ingredient.find_by(name: "Vodka"), description: "2 oz")
Dose.create(cocktail: caesar, ingredient: Ingredient.find_by(name: "Clamato juice"), description: "top up the glass")
Dose.create(cocktail: caesar, ingredient: Ingredient.find_by(name: "Worcestershire"), description: "2-3 dashes")
Dose.create(cocktail: caesar, ingredient: Ingredient.find_by(name: "Tabasco"), description: "2-3 dashes")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168333/toni-osmundson-arCQ2Xgt_OE-unsplash_f0zj7p.jpg')
caesar.photos.attach(io: file, filename: 'caesar.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603164580/5678897472437483771_img_1464-scaled_edkicl.jpg')
caesar.photos.attach(io: file2, filename: 'caesar2.jpeg', content_type: 'image/jpeg')

negroni = Cocktail.create(name: "Negroni")
Dose.create(cocktail: negroni, ingredient: Ingredient.find_by(name: "Gin"), description: "1 oz")
Dose.create(cocktail: negroni, ingredient: Ingredient.find_by(name: "Sweet Vermouth"), description: "1 oz")
Dose.create(cocktail: negroni, ingredient: Ingredient.find_by(name: "Campari"), description: "1 oz")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168370/nuff-_JKy0LtToQc-unsplash_zemrdj.jpg')
negroni.photos.attach(io: file, filename: 'negroni.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603162617/Dantes-Negroni_h7g6ov.jpg')
negroni.photos.attach(io: file2, filename: 'negroni2.jpeg', content_type: 'image/jpeg')


cuba_libre = Cocktail.create(name: "Cuba libre")
Dose.create(cocktail: cuba_libre, ingredient: Ingredient.find_by(name: "Light rum"), description: "1,5 oz")
Dose.create(cocktail: cuba_libre, ingredient: Ingredient.find_by(name: "Lime juice"), description: "0,5 oz")
Dose.create(cocktail: cuba_libre, ingredient: Ingredient.find_by(name: "Coke"), description: "4 oz")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168324/AdobeStock_321297294_hkmi6r.jpg')
cuba_libre.photos.attach(io: file, filename: 'cuba_libre.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603206557/Cubalibre-Cocktail-recipe-Havana-club_xdc4ch.jpg')
cuba_libre.photos.attach(io: file2, filename: 'cuba_libre2.jpeg', content_type: 'image/jpeg')

sidecar = Cocktail.create(name: "Sidecar")
Dose.create(cocktail: sidecar, ingredient: Ingredient.find_by(name: "Cognac"), description: "2 oz")
Dose.create(cocktail: sidecar, ingredient: Ingredient.find_by(name: "Triple sec"), description: "3/4 oz")
Dose.create(cocktail: sidecar, ingredient: Ingredient.find_by(name: "Lemon juice"), description: "3/4 oz")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168357/sidecar-cocktail_ajuih0.jpg')
sidecar.photos.attach(io: file, filename: 'sidecar.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603163010/15_Sidecar-4_huqtwh.jpg')
sidecar.photos.attach(io: file2, filename: 'sidecar2.jpeg', content_type: 'image/jpeg')


boulevardier = Cocktail.create(name: "Boulevardier")
Dose.create(cocktail: boulevardier, ingredient: Ingredient.find_by(name: "Whiskey"), description: "1 oz")
Dose.create(cocktail: boulevardier, ingredient: Ingredient.find_by(name: "Campari"), description: "1 oz")
Dose.create(cocktail: sidecar, ingredient: Ingredient.find_by(name: "Sweet Vermouth"), description: "1 oz")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168323/20150323-cocktails-vicky-wasik-boulevardier-1500x1125_az9biw.jpg')
boulevardier.photos.attach(io: file, filename: 'boulevardier.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603205118/boulevardier-cocktail-chasingkendall-1080x721_cbp8nj.jpg')
boulevardier.photos.attach(io: file2, filename: 'boulevardier2.jpeg', content_type: 'image/jpeg')


whiskey_sour = Cocktail.create(name: "Whiskey sour")
Dose.create(cocktail: whiskey_sour, ingredient: Ingredient.find_by(name: "Bourbon"), description: "1,5 oz")
Dose.create(cocktail: whiskey_sour, ingredient: Ingredient.find_by(name: "Lemon juice"), description: "1 oz")
Dose.create(cocktail: whiskey_sour, ingredient: Ingredient.find_by(name: "Bitters"), description: "2-3 dashes")
Dose.create(cocktail: whiskey_sour, ingredient: Ingredient.find_by(name: "Egg"), description: "1 oz of egg whites")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603164152/WHISKEY_SOUR_CHERRY_COUPE_GLASS_EGG_WHITE_FOAM_1024x1024_zkp2qs.jpg')
whiskey_sour.photos.attach(io: file, filename: 'whiskey_sour.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168356/Rattlesnake_taa1mq.jpg')
whiskey_sour.photos.attach(io: file2, filename: 'whiskey_sour2.jpeg', content_type: 'image/jpeg')

espresso_martini = Cocktail.create(name: "Espresso martini")
Dose.create(cocktail: espresso_martini, ingredient: Ingredient.find_by(name: "Vodka"), description: "1,5 oz")
Dose.create(cocktail: espresso_martini, ingredient: Ingredient.find_by(name: "Kahlua"), description: "1 oz")
Dose.create(cocktail: espresso_martini, ingredient: Ingredient.find_by(name: "Espresso"), description: "1 shot")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168331/armin-lotfi-DPRjMwHEAy4-unsplash_waeuiz.jpg')
espresso_martini.photos.attach(io: file, filename: 'espresso_martini.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603160015/espm1_nhyito.jpg')
espresso_martini.photos.attach(io: file2, filename: 'espresso_martini2.jpeg', content_type: 'image/jpeg')


tom_collins = Cocktail.create(name: "Tom collins")
Dose.create(cocktail: tom_collins, ingredient: Ingredient.find_by(name: "Gin"), description: "1,5 oz")
Dose.create(cocktail: tom_collins, ingredient: Ingredient.find_by(name: "Lemon juice"), description: "1 oz")
Dose.create(cocktail: tom_collins, ingredient: Ingredient.find_by(name: "Carbonated water"), description: "top up the glass")
file = URI.open('https://res.cloudinary.com/claidy/image/upload/v1602168322/tom-collins-04badba_qvoqz1.jpg')
tom_collins.photos.attach(io: file, filename: 'tom_collins.jpeg', content_type: 'image/jpeg')
file2 = URI.open('https://res.cloudinary.com/claidy/image/upload/v1603206207/AdobeStock_135227001_yudtht.jpg')
tom_collins.photos.attach(io: file2, filename: 'tom_collins2.jpeg', content_type: 'image/jpeg')










