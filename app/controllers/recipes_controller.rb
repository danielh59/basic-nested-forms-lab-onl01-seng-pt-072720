class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'ingredient')
    @recipe.ingredients.build(quantity: 'how_many')

  end

  def create
    Recipe.create(recipe_params)
  end

  def recipe_params
    params.require(:recipe).permit(:title,
     ingredients_attributes: [
     :name,
     :quantity,
    ]

    )
  end
end
