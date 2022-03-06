class Comic < ApplicationRecord
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  has_one_attached :image
  has_many :comic_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Comic.where(title: content)
    elsif method == 'forward'
      Comic.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Comic.where('title LIKE ?', '%'+content)
    else
      Comic.where('title LIKE ?', '%'+content+'%')
    end
  end
    
end
