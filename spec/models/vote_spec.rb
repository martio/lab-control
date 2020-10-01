# == Schema Information
#
# Table name: votes
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  planning_id :bigint
#  rating      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Vote, type: :model do
  it "has a valid factory" do
    expect(create(:vote)).to be_valid
  end

  it "is invalid without a rating" do
    expect(build(:vote, rating: nil)).to_not be_valid
  end
end
