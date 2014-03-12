class WriteWorker
  include Sidekiq::Worker

  def perform(event_params, project_key)
    project = Project.where(key: project_key)
    event_params[:project] = project
    Event.create!(event_params)
  end
end
