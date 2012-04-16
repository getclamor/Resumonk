class ResumesController < ApplicationController
  before_filter :correct_user, except: [:short_link]
  
  # GET /resume
  # GET /resume.json
  layout :selected_layout, only: [:show]
  def selected_layout
    current_user.resumes.find(params[:id]).layout || "application"
  end
  
  # GET /resume/new
  # GET /resume/new.json
  def new
    @resume = current_user.resumes.build if signed_in?
    @resume.educations.build
    @resume.experiences.build
    @resume.skills.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume }
    end
  end

  # GET /resume/1
  # GET /resume/1.json
  def show
    @resume = current_user.resumes.find(params[:id])
    layout = current_user.resumes.find(params[:id]).layout || "application"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resume }
      format.pdf do
        render :pdf => "file_name",
        :layout   => "resumes/#{layout}.pdf.erb",
        :template => "resumes/pdf_layouts/show.html.erb",
        :wkhtmltopdf  => Rails.root.join('bin', 'wkhtmltopdf').to_s,
      end
    end
  end

  # GET /resume/1/edit
  def edit
    @resume = current_user.resumes.find(params[:id])
  end

  # POST /resume
  # POST /resume.json
  def create
    @resume = current_user.resumes.build(params[:resume])

    respond_to do |format|
      if @resume.save
        format.html { redirect_to show_template_path(current_user, @resume) , notice: 'Resume was successfully created.' }
        format.json { render json: @resume, status: :created, location: @resume }
      else
        format.html { render action: "new" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resume/1
  # PUT /resume/1.json
  def update
    @resume = current_user.resumes.find(params[:id])

    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        format.html { redirect_to show_template_path(current_user, @resume), notice: 'Resume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume/1
  # DELETE /resume/1.json
  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end
  
  # Show Download and share links
  def show_links
    @resume = current_user.resumes.find(params[:id])
  end
  
  # Choose Template
  def show_template
    @resume = current_user.resumes.find(params[:id])
  end
  
  def choose_template
    @resume = current_user.resumes.find(params[:id])
    @resume.layout = params[:resume][:layout]
    if @resume.save!
      redirect_to show_links_path(current_user, @resume)
    else
      render 'show_template'
    end
  end
  
  def short_link
    @resume = Resume.where(short_link: params[:short_link]).first
    layout = @resume.layout || "application"
    respond_to do |format|
      format.html {  render layout: @resume.layout }# show.html.erb
      format.pdf do
        render :pdf => "file_name",
        :layout   => "resumes/#{layout}.pdf.erb",
        :template => "resumes/pdf_layouts/show.html.erb",
        :wkhtmltopdf  => Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s,
      end
    end
  end
  
  
  private
      def correct_user
        user = User.find(params[:user_id])
        redirect_to root_path unless current_user?(user)
      end
end
