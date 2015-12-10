class User < ActiveRecord::Base
  rolify
  has_one :userinfo, :dependent => :destroy
  has_many :roles, through: :users_roles
  # has_many :users_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
