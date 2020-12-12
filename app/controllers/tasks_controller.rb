class TasksController < ApplicationController
    
    before_action :set_category
    before_action :set_task, only: [:edit, :update, :show, :destory]

    
    def index
        @tasks = @category.tasks
    end

    def new
        @task = @category.tasks.create
    end

    def show
       
    end

    def create
        @task = @category.tasks.create(task_params)

        
        if @task.save
            redirect_to category_path, notice: 'Task was successfully created!' 
        else
            render :new
        end
    end

    def update
        if @task.update(task_params)
            redirect_to category_path, notice: 'Task was successfully updated!' 
        else
            render :edit
        end
    end

    def edit
    end

    def destroy
        @task.destroy
        redirect_to category_path, notice: 'Task was successfully destroyed.'
    end


    private

    def set_category
        @category = Category.find(params[:category_id])
    end

    
    def set_task
       @task = @category.tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:category_id, :name, :description, :date)
    end

end
