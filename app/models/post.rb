class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, :dependent => :destroy

  has_many :favourites, dependent: :destroy
  has_many :favourite_users, through: :favourites, source: :user

  validates :title, presence: true, uniqueness:true
  validates :category_id, presence: true

  self.per_page = 10

  def self.search(str)
    where("title ILIKE ? OR body ILIKE? ", "%#{str}%", "%#{str}%")
  end

  def self.search_by_user(user)
    where("user_id = ?", user.id)
  end

  def older
    self.class.where("id < ?", id).last
  end

  def newer
    self.class.where("id > ?", id).first
  end

  def self.count_by_user(user)
    where("user_id = ?", user.id).all.count
  end

  def fav_for(user)
    favourites.find_by_user_id user
  end


end
