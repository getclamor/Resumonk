class UsersController < ApplicationController
  before_filter :admin_user, only: [:destroy]
  before_filter :signed_in_user, only: [:show]
  before_filter :correct_user, only: [:show]
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_user
    @resumes = @user.resumes
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        
        format.html do
          sign_in @user
          flash[:success] = "Welcome to the Sample App!"
          redirect_to new_user_resume_path(current_user)
        end
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  
  private
      def correct_user
        user = User.find(params[:id])
        redirect_to root_path unless current_user?(user)
      end

      def admin_user
        redirect_to root_path unless current_user.admin?
      end
      
end
