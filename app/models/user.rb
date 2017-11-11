class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :neighborhood, :city_state, :phone, presence: true
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: 'profile_avatar.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  enum account_type: { cook: 0, user: 1 }

  has_many :products

  
end
