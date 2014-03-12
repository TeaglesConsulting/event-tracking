class ValidateEventData
  include Interactor

  def perform()
    #this lookup should be async
    #fail!(errors: 'Project does not exist') if Project.where(key: two).none?

    event = Event.new(context[:event_data])

    fail!(errors: event.errors) if event.invalid?
  end
end
