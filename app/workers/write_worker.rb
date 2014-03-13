class WriteWorker
  include Sidekiq::Worker

  def perform(event_params, project_key)
    event_params[:project] = Project.find_by(key: project_key)
    Event.create!(event_params)
  end
end
