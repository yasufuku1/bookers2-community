class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy

  has_one_attached :image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }


  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
