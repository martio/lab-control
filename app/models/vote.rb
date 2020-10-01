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
class Vote < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :planning, required: true

  validates :user_id, uniqueness: {scope: :planning_id}
  validates :rating, inclusion: { in: [1, 2, 3, 5, 8] }
end
