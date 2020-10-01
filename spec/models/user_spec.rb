# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:user, name: nil)).to_not be_valid
  end
end
