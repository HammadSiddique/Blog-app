class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :comments
  has_many :likes
  has_many :posts

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def admin?
    is? :admin
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
