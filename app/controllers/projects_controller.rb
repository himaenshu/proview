class ProjectsController < ApplicationController

	def index
		@projects = Project.order(:status, :name).paginate(:page => params[:page], :per_page => 10)
	end

	def show
		get_project
		@reviews = @project.reviews.order(reviewed_on: :desc).paginate(:page => params[:page], :per_page => 10)
	end	

	def new
		@project = Project.new
	end

	def edit
		get_project
	end

	def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_url, :notice => "Project successfully created."
    else
      render :new
    end
  end

  def update
    @project = Project.find_by_id(params[:id])
    if @project.update_attributes(project_params)
	    redirect_to projects_url, :notice => "Project successfully updated."
	  else
	  	render :edit
	  end	
  end

	private

	def get_project
		@project = Project.find_by_id(params[:id])
	end

	def project_params
    params.require(:project).permit(:name, :description, :references, :technology_stack, :status, :product_owner, :team)
  end	
	
end
