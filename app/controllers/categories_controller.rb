class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create]

  def index
    @categories= Category.all
  end

  def new
    @category= Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice]= "Category has been created."
      redirect_to category_path(@category.id)
    else 
      render :new
    end
  end

  private

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
   @category = Category.find(params[:id])
  end

end