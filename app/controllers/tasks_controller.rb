class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end
end
