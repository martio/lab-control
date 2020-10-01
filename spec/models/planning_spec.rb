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

require 'rails_helper'

RSpec.describe Planning, type: :model do
  it "has a valid factory" do
    expect(create(:planning)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:planning, name: nil)).to_not be_valid
  end
end
