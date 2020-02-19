class Event < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 5, maximum:140, message: 'length within 5 and 140 chars'}
  validates :location,
    presence: true
  validates :price,
    presence: true,
    numericality: { :only_integer => true }
  validate :price_range

  validates :description,
    presence: true,
    length: { minimum: 20, maximum:1000, message: 'length within 20 and 1000 chars'}
  validates :start_date,
    presence: true
  validates :duration,
    presence: true,
    numericality: { :only_integer => true }
  validate :duration_increment_of_5

  validates :host_id,
    presence: true

  belongs_to :host, class_name: "User"
  has_many :tickets, foreign_key: "event_id"
  has_many :guests, through: :tickets

end
