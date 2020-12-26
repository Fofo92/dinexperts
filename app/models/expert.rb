class Expert < ApplicationRecord
  belongs_to :title
  belongs_to :body, optional: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name, uniqueness: { scope: :first_name }
  has_many :memberships
  has_many :bodies, through: :membership

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
