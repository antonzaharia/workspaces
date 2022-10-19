class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def show_name
    self.name.presence || 'not set'
  end

  def show_dob
    self.dob.presence || 'not set'
  end
end
