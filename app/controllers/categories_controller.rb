class CategoriesController < ApplicationController
  def new
    @categories = Category.all
    @new_category = Category.new
  end

  def create
    @new_category = Category.new(category_params)
    if @new_category.save
      redirect_to new_category_path
    else
      @categories = Category.all
      @new_category = Category.new
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to new_category_path
    else
      @category = Category.find(params[:id])
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to new_category_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
