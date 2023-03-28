class RecipesController < ApplicationController

    def index
        render json: Recipe.all, status: :ok
    end

    def create
        recipe = current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end




    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
