# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
Product.create!([
  {title: "Default Title", description: "One of the best things about making a job out of something as fun as coffee is that everyone understands how important the toys are. We won’t deny it—getting our hands on the newest and sleekest equipment sends a little thrill up the collective spines of everyone at Irving Farm, and even more so when we’re part of a select few stores able to put new coffee equipment to the real-world tests of demanding NYC customers.", image_url: "", video_url: "", price: "1.0", shopify_product_id: 391421063, shopify_variant_id: 917108355, story_headline: "Made in El Salvador", story_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum.", instructor_name: "Josh Littlefield", instructor_description: "Josh Littlefield is the head of education at irving farms coffe and something as fun as coffee is that everyone understands how important the toys are. He is also some other stuff that's pretty important and makes you realize he knows his shit.", slug: "coffee-box"}
])

puts 'CREATED PRODUCTS'

Course.create!([
  {title: "Coffee Course", product_id: 1, slug: "coffee-course"}
])

puts 'CREATED COURSES'

Lesson.create!([
  {name: "Grinding", course_id: 1, short_description: "Learn how to grind", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci.", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum."},
  {name: "Brewing", course_id: 1, short_description: "Learn how to grind", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci.", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum."},
  {name: "Tasting", course_id: 1, short_description: "Learn how to grind", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci.", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultrices, elit sed faucibus pharetra, diam mauris bibendum orci, sit amet ullamcorper purus dui sit amet augue. Donec aliquet diam ut neque mattis, eu tristique sem rutrum."}
])

puts 'CREATED LESSONS'

Image.create!([
  {product_id: 1, shopify_url: "https://cdn.shopify.com/s/files/1/0678/3049/products/beans.png?v=1414463368", shopify_id: 907928611, featured: nil},
  {product_id: 1, shopify_url: "https://cdn.shopify.com/s/files/1/0678/3049/products/b560603671b45f2111c231e4bbd944d8.jpg?v=1414463368", shopify_id: 916560719, featured: nil},
  {product_id: 1, shopify_url: "https://cdn.shopify.com/s/files/1/0678/3049/products/85d65424a2f7abb4f9117a36ce740e2d.jpg?v=1414463368", shopify_id: 916560759, featured: nil},
  {product_id: 1, shopify_url: "https://cdn.shopify.com/s/files/1/0678/3049/products/8beee3e426debc15d3f3667a84af44bf.jpg?v=1414463368", shopify_id: 916560871, featured: nil},
  {product_id: 1, shopify_url: "https://cdn.shopify.com/s/files/1/0678/3049/products/c1dc6aacb161e474f3a15e56fb244160.jpg?v=1414465882", shopify_id: 916590791, featured: nil}
])

puts 'CREATED IMAGES'

Ingredient.create!([
  {name: "Irving Coffee", description: "The Salaverria family has been producing coffee in the northwest of El Salvador for almost 100 years. Their original farms and mill are just outside of the village of Concepción de Ataco at the northern end of the Ahuachapán-Ilamatepec mountain range. El Molino is a part of this farm group and a source of great pride for the family.", shopify_variant_id: nil, image_url: "http://cdn2.bigcommerce.com/server100/9184b/products/80/images/338/El_Molino__07202.1405351888.460.386.jpg?c=2"},
  {name: "Filter", description: "The Salaverria family has been producing coffee in the northwest of El Salvador for almost 100 years. Their original farms and mill are just outside of the village of Concepción de Ataco at the northern end of the Ahuachapán-Ilamatepec mountain range. El Molino is a part of this farm group and a source of great pride for the family.", shopify_variant_id: nil, image_url: "http://cdn2.bigcommerce.com/server100/9184b/products/80/images/338/El_Molino__07202.1405351888.460.386.jpg?c=2"},
  {name: "Cone", description: "The Salaverria family has been producing coffee in the northwest of El Salvador for almost 100 years. Their original farms and mill are just outside of the village of Concepción de Ataco at the northern end of the Ahuachapán-Ilamatepec mountain range. El Molino is a part of this farm group and a source of great pride for the family.", shopify_variant_id: nil, image_url: "http://cdn2.bigcommerce.com/server100/9184b/products/80/images/338/El_Molino__07202.1405351888.460.386.jpg?c=2"},
  {name: "Kettle", description: "The Salaverria family has been producing coffee in the northwest of El Salvador for almost 100 years. Their original farms and mill are just outside of the village of Concepción de Ataco at the northern end of the Ahuachapán-Ilamatepec mountain range. El Molino is a part of this farm group and a source of great pride for the family.", shopify_variant_id: nil, image_url: "http://www.roastmasters.com/blog/wp-content/uploads/2012/08/buono-electric-550.jpg"}
])

puts 'CREATED INGREDIENTS'

ProductIngredient.create!([
  {product_id: 1, ingredient_id: 1},
  {product_id: 1, ingredient_id: 2},
  {product_id: 1, ingredient_id: 3},
  {product_id: 1, ingredient_id: 4}
])

puts 'CREATED PRODUCT INGREDIENTS'
