class Event < ApplicationRecord
  belongs_to :category, optional: true

  validates :name, presence: true
  validates :name, length: { minimum: 3 , maximum: 100, allow_blank: true }
  validates :started_at, presence: true
  validates :finishead_at, presence: true
  validate :validate_if_started_in_future, on: :create
  validate :validate_if_finished_greater_tan_started_at


  private

  def validate_if_finished_greater_tan_started_at
    return unless started_at
    return unless finishead_at
    return if finishead_at > started_at

    errors.add(:finishead_at, :invalid)
  end

  def validate_if_started_in_future
    return unless started_at
    return if started_at >= Time.current

    errors.add(:started_at, :invalid)
  end
end
