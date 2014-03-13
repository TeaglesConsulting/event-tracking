require 'spec_helper'

describe WriteWorker, sidekiq: :inline do


  let(:project) { create(:project, key: 'superkey', name: 'test site', url: 'tracker.dev') }
  let(:params) { {event_type: 'page_view', data: { page: "/mypage/22" } } }

  it "creates a new event" do
    expect{
      WriteWorker.perform_async(params, project.key)
    }.to change{Event.count}.by(1)

    expect{Event.last.project}.to eql(project)
  end

end
