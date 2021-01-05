class Membership < ApplicationRecord
  belongs_to :expert
  belongs_to :body
  belongs_to :membership_type
  validates :membership_type, presence: true
  validates :body_id, presence: true
  validates :expert_id, presence: true
end
