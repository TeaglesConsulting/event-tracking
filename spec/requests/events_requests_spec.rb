require 'spec_helper'

describe 'Events' do

  let(:project) { create(:project, key: 'mykey', name: 'test site', url: 'tracker.dev') }
  let(:data) { '{ "foo" : "bar" }' }

  before :each do
    WriteWorker.jobs.clear
  end

  it 'queues a WriteWorker' do
    expect {
      post 'events/page_views', data, { 'Content-Type' => 'application/json', 'Authentication' => 'mykey'}
    }.to change(WriteWorker.jobs, :size).by(1)

    expect(response.status).to eql(202)
  end

end
