class DogsController < ApplicationController

  def index
      dogs = Dog.all
      render json: dogs
  end

  def create
    # Create a new dog
    dog = Dog.create(dog_params)
    render json: dog
  end

  # Handle strong parameters, so we are secure
  private
  def dog_params
    params.require(:dog).permit(:name, :age, :enjoys, :image)
  end
  

  def update
  end

  def destroy
  end

end