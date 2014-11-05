class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurants
	validates :name, presence: true
	#validates :email, presence: true

	def owner?
		self.role == "owner"
	end

	def patron?
		self.role == "patron"
	end
end
