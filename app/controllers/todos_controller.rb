class TodosController < ApplicationController
  before_action :find_project
  before_action :find_todo, only: %i[update]

  def create
    @todo = @project.todos.new(todo_params)
    if @todo.save!
      json_response(@todo, :created)
    else
      json_response(@todo)
    end
  end

  def update
    @todo.update(todo_params)
    head :no_content
  end

  private

  def todo_params
    params.permit(:text, :isCompleted)
  end

  def find_todo
    @todo = @project.todos.find_by!(id: params[:id]) if @project
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

end
