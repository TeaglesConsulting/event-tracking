require 'spec_helper'

describe 'Projects' do

  let(:valid_data) { '{ "name" : "my site", "key" : "somekey", "url" : "http:test.local" }' }
  let(:invalid_data) { '{ "foo" : "bar" }' }

  context "with valid data" do
    it "creates a project" do
      expect{
        post 'projects', valid_data, { 'Content-Type' => 'application/json' }
      }.to change{Project.count}.by(1)

      expect(response.status).to eql(201)
    end
  end

  context "with invalid data" do
    it "returns bad request header" do
      post 'projects', invalid_data, { 'Content-Type' => 'application/json' }

      expect(response.status).to eql(400)
    end
  end

end
