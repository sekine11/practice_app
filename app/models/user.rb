class User < ApplicationRecord
  validates :open_name, length: { in: 2..20 }
  validates :open_name, presence: true
  validates :private_name, length: { in: 2..20 }
  validates :private_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
