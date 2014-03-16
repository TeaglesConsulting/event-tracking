class ProjectsController < ApplicationController

  def create
    result = ValidateProjectData.perform(params: project_params)
    if result.success?
      Project.create!(project_params)
      head :created
    else
      head :bad_request
    end
  end

private
  def project_params
    { name: params[:name], key: params[:key], url: params[:url] }
  end
end
