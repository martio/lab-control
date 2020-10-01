# == Schema Information
#
# Table name: plannings
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class PlanningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
