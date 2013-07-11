class ProjectsController < ApplicationController
  def index
    logger.info "I'm in the index! yay!"
  end

  def new
    @project = Project.new
    @rhinocerous = "OMG a rhinocerous!"
    logger.info "ZOMG a new instance!"
  end

  def create
    logger.info "I'm fixin to do some creatin' oh yeah"
    @project = Project.new(params[:project])
    if @project.save  # true or false
      flash[:notice] = "Project has been created RIGHT NOW."
      logger.info "I'm about to redirect"
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end

  def show
    @project = Project.find(params[:id])
  end
end








