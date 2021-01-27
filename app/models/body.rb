class Body < ApplicationRecord
  has_many :memberships
  has_many :experts, through: :memberships
  validates :long_name, presence: true, uniqueness: true
  validates :short_name, presence: true
  validate :ending_date_after_starting_date
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

  private

  def ending_date_after_starting_date
    return if ending_date.blank? || starting_date.blank?

    if :ending_date < :starting_date
      errors.add :ending_date, "Doit être postérieure à la date de début de période"
    end
  end
end
