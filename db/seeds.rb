# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
memes = [{"title":"He tried and failed","likes":13227,"dislikes":0,"image":"https://i.redd.it/icphi2yq8qv91.jpg","description":"https://redd.it/yc78om"},{"title":"he's still under warranty too bozo","likes":161,"dislikes":0,"image":"https://i.imgur.com/3qZH50n.gif","description":"https://redd.it/ycc71e"},{"title":"Giggidy","likes":13,"dislikes":0,"image":"https://i.redd.it/mil0htax4vv91.jpg","description":"https://redd.it/ycn7nz"}]

memes.each do |each_meme|
    Meme.create each_meme
    puts "creating meme #{each_meme}"
  end