class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :create_temp_password
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_temp_password
	password_length = 8
	self.password = Devise.friendly_token.first(password_length)
  end

  ROLES = %w[admin masteradmin banned]

end
