class Expert < ApplicationRecord
  belongs_to :title
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name, uniqueness: { scope: [:first_name, :title_id] }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
