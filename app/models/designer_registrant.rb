class DesignerRegistrant < ActiveRecord::Base
  default_scope -> { order('created_at DESC') } 
  belongs_to :user
  validates :user_id, presence: true
  validates :specialty, presence: true
  validates :prefecture, presence: true
  validates :demand, presence:true
end
