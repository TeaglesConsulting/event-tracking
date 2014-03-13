class EventsController < ApplicationController

  def create
    if Event.create!(event_params)
      head :accepted
    else
      head :bad_request
    end
    # if ValidateEventData.perform(event_params).success?
    #   WriteWorker.perform_async(event_params, project_key)
    #   head :accepted
    # else
    #   head :bad_request
    # end
  end

private
  def event_params
    { event_type: params[:event_type], data: params[:data], project: project }
  end

  def project_key
    request.headers['authentication']
  end

  def project
    Project.find_by(key: project_key)
  end
end
