class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true, format: { with: /.@./ }
	validates :password, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
end
