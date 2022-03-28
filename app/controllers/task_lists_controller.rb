class TaskListsController < ApplicationController
  before_action :verify_task_list_onwership, only: [:show, :edit, :update, :delete, :removeTask, :addTask]

  def index
    @task_lists = TaskList.where(user_id: cookies.signed[:user_id])
  end

  def new
  end

  def create
    new_task_list = TaskList.new
    params[:list_of_tasks] = []
    params[:user_id] = session[:user_id]
    filtered_params = params.permit(:name, :location, :note, :list_of_tasks, :user_id)
    new_task_list.update(filtered_params)
    redirect_to(task_lists_path)
  end

  def edit
    @task_list = TaskList.find_by_id(params[:task_list_id])
  end

  def update
    task_list = TaskList.find_by_id(params[:task_list_id])
    filtered_params = params.permit(:name, :location, :note)
    task_list.update(filtered_params)
    redirect_to(task_lists_path)
  end

  def destroy
    task_list = TaskList.find_by_id(params[:task_list_id])
    for task in task_list.list_of_tasks
      Task.find_by_id(task).update(task_list: '')
    end
    task_list.destroy!
    redirect_to(task_lists_path)
  end

  def show_tasks
    @task_list = TaskList.find_by_id(params[:task_list_id])
    @tasks = @task_list.list_of_tasks.uniq
    @all_tasks = Task.where(user_id: session[:user_id])
  end

  def add_task
    if(params[:task_id] != '')
      task_list = TaskList.find_by_id(params[:task_list_id])
      Task.find_by_id(params[:task_id]).update(task_list: task_list.name)
      task_list.list_of_tasks.push(params[:task_id])
      task_list.save!
    end

    redirect_back(fallback_location: task_lists_path)
  end

  def remove_task
    task_list = TaskList.find_by_id(params[:task_list_id])
    task_list.list_of_tasks.delete(params[:task_id])
    Task.find_by_id(params[:task_id]).update(task_list: '')
    task_list.save!

    redirect_back(fallback_location: task_lists_path)
  end

  private
  def verify_task_list_onwership
    if (TaskList.find_by_id(params[:task_list_id]).user_id != session[:user_id])
      redirect_to(task_lists_path, alert: 'Unauthorized access')
    end
  end

end
