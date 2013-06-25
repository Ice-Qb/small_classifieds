class StaticPagesController < ApplicationController
  before_filter :admin_user, only: [:admin]	
  def home
  	@classifieds = Classified.paginate(page: params[:page])
  end

  def about  	
  end

  def admin
    @classifieds = Classified.paginate(page: params[:page])  	
  end
end
