class User < ApplicationRecord

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true
  #
  # has_many :tickets, as: :guest, foreign_key: 'guest_id'
  # has_many :events, through: :tickets
  # has_many :events, as: :host, foreign_key: 'host_id'

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
