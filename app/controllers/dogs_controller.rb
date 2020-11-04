class DogsController < ApplicationController
    
    def index 
        @dogs = Dog.all 
    end 

    def show 
        @dog = Dog.find_by(id: params[:id])
    end 

    def new 
    end 

    def create 
    end 

    def edit 
    end 

    def update 
    end 

    def destroy 
    end 

    private 

    def strong_params 
        params.require(:dog).permit(:name, :breed, :age)
    end 

    def find_by 
        params.find_by(id:params[:id])
    end 
end
