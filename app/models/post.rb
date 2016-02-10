class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  validates :title, presence: true, uniqueness:true
  self.per_page = 10

  def self.search(str)
    where("title ILIKE ? OR body ILIKE ?", "%#{str}%", "%#{str}%")
  end

end
