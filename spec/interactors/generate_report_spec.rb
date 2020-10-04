require 'spec_helper'

RSpec.describe GenerateReport, type: :interactor do
  let(:planning) { create(:planning) }

  it "succeeds" do
    expect(GenerateReport.call({
      :planning => planning
    }).success?).to be true
  end
end
