class StaticPagesController < ApplicationController
	
  def home
  	@categories = Category.all
  	@category = Category.find_by_name(params[:name])
  	if params[:name]
      @classifieds = Category.tagged_with(@category.name).paginate(page: params[:page])
    else
      @classifieds = Classified.paginate(page: params[:page])
    end  	
  end

  def about  	
  end

end
