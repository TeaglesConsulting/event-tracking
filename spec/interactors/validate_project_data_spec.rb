require 'spec_helper'

describe ValidateProjectData do
  describe ".perform" do

    let(:params) { {name: 'Some Project', key: 'somekey', url: ''} }
    let(:invalid_params) { {name: '', key: '', url: 'http://test.local'} }

    it "succeeds with valid data" do
      expect(ValidateProjectData.perform(params: params)).to be_success
    end

    it "fails with invalid data" do
      expect(ValidateProjectData.perform(params: invalid_params)).to be_failure
    end
  end
end
