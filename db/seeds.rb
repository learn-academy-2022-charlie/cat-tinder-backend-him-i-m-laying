# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

dogs = [
  {
    name: 'Daisy',
    age: 2,
    enjoys: 'Long naps on the couch, and a warm fire.',
    image: 'https://unsplash.com/photos/VpFhcbrFbFo'
  },
  {
    name:'George',
    age: 5,
    enjoys: 'Food mostly, really just food.',
    image: 'https://images.unsplash.com/photo-1520825944622-a66c85325472?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRvZ3MlMjBjbG9zZSUyMHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60'
  },
  {
    name: 'Jack',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://images.unsplash.com/photo-1521309569781-7bcd429eb2f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGRvZ3MlMjBjbG9zZSUyMHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60'
  }, 
]

dogs.each do |attributes|
  Dog.create attributes
  # puts "creating dog #{each_dog}"
end

p Dog.all
p "there should be 3 Dog's Seeds"

#https://unsplash.com/photos/urs_y9NwFcc
