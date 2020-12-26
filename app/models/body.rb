class Body < ApplicationRecord
  has_many :memberships
  has_many :experts, through: :memberships
  validates :long_name, presence: true, uniqueness: true
  validates :short_name, presence: true, uniqueness: true
  has_ancestry
end
