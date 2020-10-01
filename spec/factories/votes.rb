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

FactoryBot.define do
  factory :vote do
    user
    planning
    rating { Vote::RATINGS.sample }
  end
end
