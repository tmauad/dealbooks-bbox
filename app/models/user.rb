# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = [
    USER = 'user',
    MODERATOR = 'moderator',
    ADMIN = 'admin'
  ].freeze

  validates :email, :role, presence: true
  validates :email, uniqueness: true
  validates :role, inclusion: { in: ROLES }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise(
    :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable,
    omniauth_providers: [:linkedin]
  )

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
