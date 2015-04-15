class Picture < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :pic_source, presence:true
  validates :user_id, numericality: true
end
