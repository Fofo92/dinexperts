class Body < ApplicationRecord
  validates :long_name, presence: true, uniqueness: true
  validates :short_name, presence: true, uniqueness: true
  has_ancestry
end
