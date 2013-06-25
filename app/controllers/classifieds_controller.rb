class ClassifiedsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :admin_user, only: [:edit, :update, :destroy]

  def show
    @classified = Classified.find(params[:id]) 	
  end

  def new
    @classified = Classified.new    	
  end

  def create
    @classified = current_user.classifieds.build(params[:classified])
    if @classified.save
      flash[:success] = "Classified created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @classified = Classified.find(params[:id])  	
  end

  def update
    if Classified.find(params[:id]).update_attributes(params[:classified])
      flash[:success] = "Classified updated!"
      redirect_to root_url
    else
      render 'edit'
    end  	
  end

  def destroy
    Classified.find(params[:id]).destroy
    flash[:success] = "Classified destroyed!"
    redirect_to root_url
  end
end