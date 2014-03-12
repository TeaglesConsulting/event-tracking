class EventsController < ApplicationController

  def create
    if ValidateEventData.perform(event_params).success?
      WriteWorker.perform_async(event_params, project_key)
      head :accepted
    else
      head :bad_request
    end
  end

private
  def event_params
    { event_type: params[:event_type], data: params[:data] }
  end

  def project_key
    request.headers['authentication']
  end

end
