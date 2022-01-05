#===========================================================================
# USER
#===========================================================================
class User < ActiveRecord::Base
  include EmailValidatable

  #=========================================================================
  # RELATIONS
  #=========================================================================
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  #=========================================================================
  # VALIDATIONS
  #=========================================================================
  validates :first_name, :last_name, :email, presence: true
  validates :email, email: true
end
