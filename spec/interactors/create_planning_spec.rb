require 'rails_helper'

RSpec.describe CreatePlanning, type: :interactor do
  it "succeeds" do
    expect(CreatePlanning.call({
      :name => "Test"
    }).success?).to be true
  end
end
