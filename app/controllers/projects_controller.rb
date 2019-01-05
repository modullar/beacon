class ProjectsController < ApplicationController

  before_action :authenticate_account!, except: [:index, :show]
  before_action :scope_project, only: [:show, :edit, :delete, :update]

  def index
    @projects = Project.all.order(:name)
  end

  def new
    @project = Project.new(name: "My Project")
  end

  def create
    @project = Project.new(project_params.merge(account_id: current_account.id))
    if @project.save
      redirect_to @project
    else
     flash[:error] = @project.errors.full_messages
     render :new
    end
  end

  def edit
    redirect_to :show unless @project.account == current_account
  end

  def show
  end

  def update
    if @project.update_attributes(project_params)
      flash[:notice] = "The project was successfully updated."
      redirect_to @project
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :url, :coc_url, :description)
  end

  def scope_project
    @project = Project.find_by(slug: params[:slug])
    @settings = @project.project_setting
    @issues = @project.issues
  end

end
