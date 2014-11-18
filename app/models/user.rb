class User < ActiveRecord::Base
  include Statusable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :votes
  has_many :favorites
  has_many :posts
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 } # email: true
  validates :password, presence: true, confirmation: true, length: { minimum: 5 }
end