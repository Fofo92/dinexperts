class MembershipType < ApplicationRecord
  validates :long_name, presence: true
  validates :short_name, presence: true
  has_many :memberships
end
