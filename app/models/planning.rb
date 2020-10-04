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
class Planning < ApplicationRecord
  enum status: [:active, :completed]

  has_many :votes, dependent: :destroy

  validates :name, presence: true
  validates :name, length: {in: 3..30}
  validates :name, format: {with: /\A[a-záéíóúýčďěňřšťžůåøäöüąćęłńśźżĺľôŕ0-9\(\)\#\._ ]+\z/i}
  validates :name, uniqueness: {case_sensitive: false}

  def self.current
    Planning.active.order(created_at: :desc).limit(1).first
  end
end
