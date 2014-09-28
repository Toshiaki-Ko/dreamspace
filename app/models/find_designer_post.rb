class FindDesignerPost < ActiveRecord::Base
  mount_uploader :fdpimage, FdpimageUploader
  mount_uploader :fdpimage2, Fdpimage2Uploader
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :area,  presence: true
  validates :purpose,  presence: true
  validates :demand,  presence: true, length: { maximum: 500 }
end
