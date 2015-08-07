class TasksController < ApplicationController

	def index
		if params[:review_id]
			@review = Review.find_by_id(params[:review_id])
			@project = @review.project
			@risks = @review.risks
			@recommendations = @review.recommendations
		elsif params[:project_id]
			@project = Project.find_by_id(params[:project_id])
			@risks = @project.risks
			@recommendations = @project.recommendations
		end	
		render "reviews/show"
	end

	def show
		get_task
	end

	def new
		@review = Review.find_by_id(params[:review_id])
		@task = obj_class.new(review_id: @review.id)
	end	

	def edit
		get_task
	end

	def create
    @task = Task.new(task_params)
    @review = @task.review
    if @task.save
      redirect_to review_url(@task.review_id), :notice => "Review successfully created."
    else
      render :new
    end
  end


  def update
    @task = Task.find_by_id(params[:id])
    if @task.update_attributes(task_params)
    	@task.update_attributes(task_params)
	    redirect_to review_url(@task.review_id), :notice => "Review successfully updated."
	  else
	  	@review = @task.review
	  	render :edit
	  end	
  end

	def update_status
		get_task
		if params[:status]=='Close'
			@task.set_close
		elsif params[:status]=='Open'
			@task.set_open
		end
		@task.save
    redirect_to review_url(@task.review_id)
	end
		
	private

	def task_params
		if params[:risk]
    	params.require(:risk).permit(:type, :review_id, :title, :description, :implementation, :owner, :status)
    else
    	params.require(:recommendation).permit(:type, :review_id, :title, :description, :implementation, :owner, :status)
    end	
  end	

	def obj_class
		params[:type].camelize.constantize
	end

	def get_task
		@task = Task.find_by_id(params[:id])
		@review = @task.review
	end		

end
