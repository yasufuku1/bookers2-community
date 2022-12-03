class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users

  has_one_attached :image

  validates :name,presence:true
  validates :introduction,presence:true


  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
