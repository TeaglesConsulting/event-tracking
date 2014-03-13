class ValidateEventData
  include Interactor

  def perform
    fail!(error: 'Project not found') unless Project.where(key: project_key).exists?
  end
end
