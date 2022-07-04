require 'rails_helper'

RSpec.describe Dog, type: :model do
  it "should validate name" do
    dog = Dog.create(
    age: 2,
    enjoys: 'Eating his food',
     image: 'https://images.unsplash.com/photo-1534351450181-ea9f78427fe8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRvZ3N8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60')
     p Dog.first
     expect(dog.errors[:name]).to_not be_empty
   end
   it "should validate age" do
    dog = Dog.create( 
    name:"Remi",
    enjoys: 'Eating his food',
     image: 'https://images.unsplash.com/photo-1534351450181-ea9f78427fe8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRvZ3N8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60')
     expect(dog.errors[:age]).to_not be_empty
   end
   it "should validate enjoys" do
    dog = Dog.create(
    name:"Remi",
    age: 2,
     image: 'https://images.unsplash.com/photo-1534351450181-ea9f78427fe8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRvZ3N8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60')
     expect(dog.errors[:enjoys]).to_not be_empty
   end
   it "should validate if enjoys is at least 10 characters long" do
  dog = Dog.create(
    name:'Remi',
    age: 2,
    enjoys: 'Eating',
    image: 'https://images.unsplash.com/photo-1534351450181-ea9f78427fe8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRvZ3N8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60')
     expect(dog.errors[:enjoys]).to_not be_empty
    end
     it "should validate if enjoys is at least 10 characters long" do
  dog = Dog.create(
    name:'Remi',
    age: 2,
    enjoys: 'Eating',
    image: 'https://images.unsplash.com/photo-1534351450181-ea9f78427fe8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRvZ3N8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60')

    it"should validate image" do
      dog = Dog.create(
        name:'Remi',
        age: 2,
        enjoys: 'Eating his food') 
      expect(dog.errors[:image]).to_not be_empty
      end
    end  
      
      
     
   


  
  


