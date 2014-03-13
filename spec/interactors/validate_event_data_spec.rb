require 'spec_helper'

describe ValidateEventData do
  describe ".perform" do
    let(:project) { create(:project, name: 'Test App', key: 'somekey') }

    it "succeeds with valid data" do
      expect(ValidateEventData.perform(project_key: project.key)).to be_success
    end

    it "fails without a valid project" do
      expect(ValidateEventData.perform(project_key: 'noexist')).to be_failure
    end

  end
end
