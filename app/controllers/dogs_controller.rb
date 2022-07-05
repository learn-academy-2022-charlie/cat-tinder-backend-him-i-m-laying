class DogsController < ApplicationController

  def index
    dogs = Dog.all
    render json: dogs
  end

  def create
    # Create a new dog
    dog = Dog.create(dog_params)
    if dog.valid?
    render json: dog
    else
      render json: dog.errors, status: 422
    end
  end
  
  def update
    dog = Dog.find(params(:id))
    dog.update(dog_params)
    render json: dog
  end
    
  def destroy
  end

  # Handle strong parameters, so we are secure
  private
  def dog_params
    params.require(:dog).permit(:name, :age, :enjoys, :image)
  end
end