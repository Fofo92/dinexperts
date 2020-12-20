class Title < ApplicationRecord
has_many :experts
validates :long_title, presence: true
validates :short_title, presence: true
end
