class TasksController < ApplicationController
  before_action :verify_task_onwership, only: [:edit, :update, :delete, :complete]

  def index
    @show_completed = params[:show_completed] == 'true'
    @tasks = @show_completed ? Task.where(user_id: session[:user_id]) : Task.where(completion_date: nil, user_id: session[:user_id])
  end

  def new
  end

  def create
    new_task = Task.new
    params[:duration] = (params[:hours].to_i * 60) + params[:mins].to_i
    params[:user_id] = session[:user_id]
    filtered_params = params.permit(:name, :location, :deadline, :note, :duration, :scheduled_event, :user_id)
    new_task.update(filtered_params)
    redirect_to(tasks_path)
  end

  def edit
    @task = Task.find_by_id(params[:id])
  end

  def update
    task = Task.find_by_id(params[:id])
    params[:duration] = (params[:hours].to_i * 60) + params[:mins].to_i
    params[:completion_date] = nil if params[:completion_date] == ''
    params[:scheduled_event] = false if !params[:scheduled_event]
    filtered_params = params.permit(:name, :location, :deadline, :note, :duration, :scheduled_event, :planned_completion_date, :completion_date)
    task.update(filtered_params)
    redirect_to(tasks_path)
  end

  def destroy
    task = Task.find_by_id(params[:id])
    task.destroy!

    redirect_to(tasks_path)
  end

  def complete
    task = Task.find_by_id(params[:id])
    curr_time = Time.now.strftime('%D')
    task.update(completion_date: curr_time)
    redirect_to(tasks_path)
  end

  private
  def verify_task_onwership
    if (Task.find_by_id(params[:id]).user_id != session[:user_id])
      redirect_to(tasks_path, alert: 'Unauthorized access')
    end
  end

end
