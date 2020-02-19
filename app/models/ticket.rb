class Ticket < ApplicationRecord
  validates :event_id,
    presence: true
  validates :guest_id,
    presence: true

  belongs_to :event
  belongs_to :guest, class_name: "User"
end
