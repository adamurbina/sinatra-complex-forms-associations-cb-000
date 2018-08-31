class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owner = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    binding.pry
    @pet = Pet.create(name: params[:pet_name])

    if !(params[:owner_name] == "")
      @owner = Owner.create(params[:owner_name])
      @owner.pets << @pet
    end
    binding.pry
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
