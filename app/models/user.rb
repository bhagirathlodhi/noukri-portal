class User < ApplicationRecord
  rolify
  has_many :jobs, dependent: :destroy
  #has_many :requests, dependent: :destroy
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable   
end
