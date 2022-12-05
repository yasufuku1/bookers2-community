class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user

  has_one_attached :image

  validates :name,presence:true
  validates :introduction,presence:true


  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end

end
