class CategoriesController < ApplicationController
  before_filter :admin_user

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "New category created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category destroyed!"
    redirect_to root_url
  end
end