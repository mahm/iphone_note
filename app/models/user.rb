class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :notes, dependent: :delete_all

  attr_accessible :email, :password, :password_confirmation, :remember_me

  ID_NOT_FOUND     = 'ID_NOT_FOUND'.freeze
  PASSWORD_INVALID = 'PASSWORD_INVALID'.freeze
  def User.authenticate(email, pass)
    user = User.find_by_email(email)
    raise ActiveRecord::RecordNotFound, ID_NOT_FOUND     unless user
    raise ActiveRecord::RecordNotFound, PASSWORD_INVALID unless user.valid_password?(pass)
    return user
  end

end





