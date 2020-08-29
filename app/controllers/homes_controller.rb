class HomesController < ApplicationController
  before_action :user_login?, only: :about

  def user_login?
    if user_signed_in?
      redirect_to top_path
      flash[:alert] = "ログイン中です。"
    end
  end

  def about
    
  end

  def top
    @main_post_images = PostImage.where(user_id: current_user.id).order("RAND()").limit(30)
    @categories = Category.where(user_id: current_user.id)
    @post_images = PostImage.where(user_id: current_user.id).order("RAND()").limit(9)
  end
end
