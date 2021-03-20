class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
    
    @tasks = @tasks.order(expired_at: :DESC) if params[:sort_expired]
   
    @tasks = @tasks.order(priority: :DESC) if params[:sort_priority]
   
    @tasks = @tasks.title_search(params[:title]) if params[:title]
    if params[:status] != "" && params[:status] != nil
      @tasks = @tasks.status_search(params[:status])
    end
    
    @tasks = @tasks.order(created_at: :DESC)

    @tasks = @tasks.page(params[:page]).per(5)
    # @tasks = @tasks.title_search(params[:title])
    # @tasks = @tasks.status_search(params[:status])
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      
      redirect_to tasks_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: '編集しました'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
      redirect_to tasks_path, notice: '削除しました'
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :expired_at, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
