class ValidateProjectData
  include Interactor

  def perform
    fail!(error: 'Invalid project data') unless Project.new(context[:params]).valid?
  end
end
