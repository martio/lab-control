# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :name, presence: true
  validates :name, length: {in: 3..30}
  validates :name, format: {with: /\A[a-záéíóúýčďěňřšťžůåøäöüąćęłńśźżĺľôŕ0-9\(\)\._ ]+\z/i}
  validates :name, uniqueness: {case_sensitive: false}
end
