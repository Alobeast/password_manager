class Password < ApplicationRecord
  has_many :user_passwords, dependent: :destroy
  has_many :users, through: :user_passwords

  encrypts :username
  encrypts :password

  validates :username, presence: true
  validates :url, presence: true
  validates :password, presence: true
end
