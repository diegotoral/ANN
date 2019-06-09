class User < ApplicationRecord
  has_many :notebooks, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
