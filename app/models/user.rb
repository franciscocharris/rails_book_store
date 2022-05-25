# frozen_string_literal: true

class User < ApplicationRecord
  has_one :author, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :email, :password, :Date_birth, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
