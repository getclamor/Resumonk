class StaticPagesController < ApplicationController
  def home
    @user = User.new
    redirect_to [current_user, @resume] if signed_in?
  end
  
  def about
    @user = User.new
  end

  def toc
    @user = User.new
  end

  def privacy
    @user = User.new
  end

  def faq
    @user = User.new
  end
  
  def resume_templates
  end
end
