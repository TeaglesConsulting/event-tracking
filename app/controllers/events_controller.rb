class EventsController < ApplicationController

  def create
    WriteWorker.perform_async(event_params, project_key)
    head :accepted
  end

private
  def event_params
    { event_type: params[:event_type], data: params[:data] }
  end

  def project_key
    request.headers['authentication']
  end

end
