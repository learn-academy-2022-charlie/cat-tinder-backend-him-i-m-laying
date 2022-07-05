require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
     it "gets a list of dogs" do
      Dog.create(
        name: 'Sassie',
        age: 4,
        enjoys: 'Chasing balls, and plenty of sunshine.',
        image: 'https://thisdogdoesnotexist.com/'
      )
  
      get '/dogs'

      dog = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(sassie.length).to eq 1
    end
  end
end
  describe "POST/create"do
    it"creates a dog" do
      dog_params = {
        dog: {
          name: 'Buster',
          age: 4,
          enjoys: 'Chasing balls, and plenty of sunshine.',
          image: 'https://thisdogdoesnotexist.com/'
        }
      }
      post '/dogs', params: dog_params
      expect(response).to have_http_status(200)
      dog = Dog.first
      expect(dog.name).to eq 'Buster'
    end
  end
#   it"does not create a dog without a name" do
#     dog_params = {
#       dog: {
#         age: 4,
#         enjoys:'Chasing balls, and plenty of sunshine',
#         image:"https://thisdogdoesnotexist.com/"
#       }
#     }
#     post '/dogs', params: dog_params
#     expect(response.status).to eq 422
#     json = JSON.parse(response.body)
#     expect(json['name']).to include "can't be blank"
#     end
#   it "does not create a dog without an age" do
#     dog_params = {
#       dog: {
#       name:"Remi",
#       enjoys:'Chasing balls, and plenty of sunshine',
#       image: "https://thisdogdoesnotexist.com/"
#     }
#   }
#   post '/dogs', params: dog_params
#   expect(response.status).to eq 422
#   json = JSON.parse(response.body)
#   expect(json['age']).to include "can't be blank"
# end
#   it "does not create a dog without an entry for enjoys" do
#     dog_params = {
#       dog: {
#       name:"Remi",
#       age: 2,
#       image: "https://thisdogdoesnotexist.com/"
#     }
#   }
#   post '/dogs', params: dog_params
#     expect(response.status).to eq 422
#     json = JSON.parse(response.body)
#     expect(json['enjoys']).to include "can't be blank"
#     end
# it "doesn't create a dog without an image" do
#   dog_params = {
#       dog: {
#       name:"Remi",
#       age: 2,
#       enjoys:'Chasing balls, and plenty of sunshine'
#   }
# }  
#  post '/dogs', params: dog_params
#  expect(response.status).to eq 422
#   json = JSON.parse(response.body)
#   expect(json['image']).to include "can't be blank"
#     end
#   end 
# end