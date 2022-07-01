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
      expect(dog.length).to eq 1
    end
  end
end
describe "POST/create"do
  it "creates a dog" do
    dog_params = {
      dog: {
        name: 'Buster',
        age: 4,
        enjoys: 'Chasing balls, and plenty of sunshine.',
        image: 'https://images.unsplash.com/photo-1521309569781-7bcd429eb2f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGRvZ3MlMjBjbG9zZSUyMHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60'
      }
    }
    
    post '/dogs', params: dog_params
    expect(response).to have_http_status(200)
    dog = Dog.first
    expect(dog.name).to eq 'Buster'
  end
end
