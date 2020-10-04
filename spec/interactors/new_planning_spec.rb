require 'spec_helper'

RSpec.describe NewPlanning, type: :interactor do
  it "succeeds" do
    expect(NewPlanning.call({
      :name => "Test"
    }).success?).to be true
  end
end
