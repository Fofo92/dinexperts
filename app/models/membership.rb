class Membership < ApplicationRecord
  belongs_to :expert
  belongs_to :body
  belongs_to :membership_type
end
