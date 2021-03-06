class User < ApplicationRecord
  has_many :library_users
  has_many :libraries, through: :library_users
  
  has_secure_password

  validates :email, presence: true, uniqueness: true, length: {minimum: 3}
  validates :first_name, presence: true, uniqueness: true, length: {minimum: 3}
  validates :last_name, presence: true, uniqueness: true, length: {minimum: 3}

  def self.confirm(params)
      @user = User.find_by({email: params[:email]})
      @user.try(:authenticate, params[:password])
  end
end
