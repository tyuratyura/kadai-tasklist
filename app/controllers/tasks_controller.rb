class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
     @pagy, @tasks = pagy(Task.order(id: :desc), items:3)
  end

  def show
  end

  def new
      @task=Task.new
  end

  def create
      @task=Task.new(task_params)
      
      if @task.save
          flash[:success]="投稿は正常に処理されました"
          redirect_to @task
      else
        flash[:danger]="投稿は処理されませんでした"
        render:new
      end
  end

  def edit
  end

  def update
      
      if @task.update(task_params)
          flash[:success]="投稿は正常に更新されました"
          redirect_to @task
      else
        flash[:danger]="投稿が更新されませんでした"
        render:new
      end
  end

def destroy
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
end


  private

def set_task
  @task=Task.find(params[:id])
end

def task_params
    params.require(:task).permit(:content,:status)
end
end
