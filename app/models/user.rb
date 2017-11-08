class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :neighborhood, :city_state, :phone, presence: true

  enum account_type: { cook: 0, user: 1 }

  has_many :products
end
