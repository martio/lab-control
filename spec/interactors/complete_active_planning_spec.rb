require 'spec_helper'

RSpec.describe CompleteActivePlanning, type: :interactor do
  it "succeeds" do
    expect(CompleteActivePlanning.call().success?).to be true
  end
end
