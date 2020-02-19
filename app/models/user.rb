class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_secure_password
  # validates :first_name,
  #   presence: true
  # validates :last_name,
  #   presence: true
  # validates :first_name,
  #   presence: true
  # validates :description,
  #   presence: true

  #validates :password, presence: true, length: { minimum: 6, message: '6 caractères minimum! '}
  after_create :welcome_send

  has_many :tickets, as: :guest, foreign_key: "guest_id"
  has_many :events, through: :tickets
  has_many :events, as: :host, foreign_key: "host_id"

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
