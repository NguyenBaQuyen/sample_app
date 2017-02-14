class User < ApplicationRecord
  enum gender: [:male, :female]
  before_save :downcase_email
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  validates :password, presence: true, length: {maximum: 6}
  validates :gender, presence: true
  has_secure_password
  private
  def downcase_email
    self.email = email.downcase
  end

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end
end
