class Membership < ApplicationRecord
  belongs_to :expert
  belongs_to :body
  belongs_to :membership_type
  validates :membership_type, presence: true
  validates :body_id, presence: true
  validates :expert_id, presence: true
  validate :ending_at_after_starting_at

  private

  def ending_at_after_starting_at
    return if ending_at.blank? || starting_at.blank?

    if :ending_at < :starting_at
      errors.add :ending_at, "Doit être postérieure à la date de début de période"
    end
  end
end
