# README

As a developer, I can create a new Rails application with a Postgresql database.
```
$ rails new cat-tinder-backend -d postgresql -T
$ cd cat-tinder-backend
$ rails db:create
$ bundle add rspec-rails
$ rails generate rspec:install
Add the remote from your GitHub classroom repository
Create a default branch (main)
Make an initial commit to the repository
$ rails server
```
$ rails generate resource Dog name:string age:integer enjoys:text image:text
$ rails db:migrate
```
every time you start rspec go to terminal and run $ rspec spec --- very important to make sure that test suite is running. Test should just finish successfully.
```
As a developer, I can create a RSpec testing suite in my Rails application.
```
Running the install commands for RSpec will add the dependencies to our Gemfile and installs all the necessary files to create and run our tests. RSpec will only load when we are in development or test mode, and not production.

```
As a developer, I can add a resource for Cat that has a name, an age, what the cat enjoys doing, and an image.
```
$ rails generate resource Cat name:string age:integer enjoys:text image:text
$ rails db:migrate
```
in db/migrate/
class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.text :enjoys
      t.text :image

      t.timestamps
    end
  end
end
```
As a developer, I can add cat seeds to the seeds.rb file.
As a developer, I can run the rails command to add cats to database.
```
Add seeds into seeds.rb file 
```
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

dogs.each do |each_dog|
  Dog.create each_dog
  puts "creating dog #{each_dog}"
end

```
ran these commands after entering data into the seeds.rb
```
$rails db:seed
$ rails db:drop
```
optional commands if anything goes wrong with the database.
```
rails db:drop
$ rails db:create
$ rails db:migrate
$ rails db:seed
```
go into rails -s in terminal and look for Dog.all. $ rails c and look for the cats with Dog.all. There will be a collection of cat hashes with unique ids, created_at timestamps, and updated_at timestamps.
```
As a developer, I can enable my controller to accept requests from outside applications.
-- use command in rails -s $ rails routes
match these to the HTTP verbs and Restful routes. 
As a developer, I can add the CORS gem to my Rails application.
``` in Gemfile
$ gem 'rack-cors', :require => 'rack/cors'
```

```
As a developer, I can add the cors.rb file to my application.
```
config/initializers  add new file cors.rb
config/initializers/cors.rb
```
Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
in cors.rb file add that code
```
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```
in terminal run $ bundle this updates the dependencies. This allows to accept POST, PUT, DELETE requests in our server side application.
```
As a developer, I can add an index request spec to my application.

```
require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
    it" gets a list of dogs" do
      Dog.create(
        name: 'Sassie',
        age: 4 ,
        enjoys: 'Chasing birds',
        image: 'https://images.unsplash.com/photo-1568393691622-c7ba131d63b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80'
      )
      get '/dogs'
      dog = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length)to eq 1
    end
  end
end
```
in terminal run rspec spec command should get output similar to :
```
Started GET "/" for ::1 at 2022-06-30 11:27:19 -0700
Processing by Rails::WelcomeController#index as HTML
  Rendering /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/railties-7.0.3/lib/rails/templates/rails/welcome/index.html.erb
  Rendered /Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/railties-7.0.3/lib/rails/templates/rails/welcome/index.html.erb (Duration: 1.6ms | Allocations: 372)
Completed 200 OK in 7ms (Views: 4.7ms | Allocations: 1245)
```
As a developer, I can add an index endpoint to my application.
```
We ran test in terminal - using rspec and copied the route using relative path
```
  dog-tinder-backend git:(main) $ rspec spec/requests/dogs_spec.rb
```
we expect error 
```
Failed examples:
```
 terminal 
rspec ./spec/requests/dogs_spec.rb:5 # Dogs GET /index  gets a list of dogs
```
add code to dogs_controller.rb  file to make test pass 
```
class DogsController < ApplicationController

  def index
      dogs = Dog.all
      render json: dogs
  end
  ```
  now test passes in terminal use up arrow to rerun previous command
  ```
  Dogs
  GET /index
    gets a list of dogs

Finished in 0.05926 seconds (files took 0.87402 seconds to load)
1 example, 0 failures
```
As a developer, I can add a create request spec to my application.
go into spec/requests/dog_spec.rb


the terminal displays:
```
 1) POST/create creates a dog
     Failure/Error: expect(response).to have_http_status(200)
       expected the response to have status code 200 but it was 204
     # ./spec/requests/dogs_spec.rb:31:in `block (2 levels) in <top (required)>'
     ```
      post '/dogs', params: dog_params
    expect(response).to have_http_status(200)
    dog = Dog.first
    expect(dog.name).to eq 'Buster'
  end
end
```
As a developer, I can add a create endpoint to my application.
go to file controllers/dog_controller.rb

add method:
```
def create
    # Create a new dog
    dog = Dog.create(cat_params)
    render json: dog
  end

  # Handle strong parameters, so we are secure
  private
  def dog_params
    params.require(:dog).permit(:name, :age, :enjoys, :image)
  end
  ```
  tests should pass in terminal use up arrow to run test again.
  ```
  Dogs
  GET /index
    gets a list of dogs

POST/create
  creates a dog

Finished in 0.06494 seconds (files took 0.93622 seconds to load)
2 examples, 0 failures

```