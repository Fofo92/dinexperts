class Body < ApplicationRecord
  has_many :memberships
  has_many :experts, through: :memberships
  validates :long_name, presence: true, uniqueness: true
  validates :short_name, presence: true
  has_ancestry

  def full_short_name
    string = ''
    self.ancestors.each do |ancestor|
      string += "#{ancestor.short_name}/"
    end
    string += self.short_name
  end

  def full_long_name
    string = ''
    self.ancestors.each do |ancestor|
      string += "#{ancestor.long_name}/"
    end
    string += self.long_name
  end

  def full_name
    "#{self.full_short_name}: #{self.long_name}"
  end
end
