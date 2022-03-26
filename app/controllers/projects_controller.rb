class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    json_response(@projects, :ok, :todos)
  end
end
