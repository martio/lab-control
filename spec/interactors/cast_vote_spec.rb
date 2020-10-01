require 'rails_helper'

RSpec.describe CastVote, type: :interactor do
  let(:user)     { create(:user)     }
  let(:planning) { create(:planning) }

  it "succeeds" do
    expect(CastVote.call({
      :user     => user,
      :planning => planning,
      :rating   => 3
    }).success?).to be true
  end
end
