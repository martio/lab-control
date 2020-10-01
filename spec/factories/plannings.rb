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

FactoryBot.define do
  factory :planning do
    sequence :name do |n|
      "Planning #{n}"
    end

    factory :active_planning do
      status { 'active' }
    end

    factory :completed_planning do
      status { 'completed' }
    end
  end
end
