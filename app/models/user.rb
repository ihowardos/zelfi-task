class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  has_many :events, dependent: :destroy
  has_many :event_registrations
  has_many :user_registrations, through: :event_registrations, source: :event
end
