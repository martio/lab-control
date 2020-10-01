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
require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
