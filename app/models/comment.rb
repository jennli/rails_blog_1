class Comment < ActiveRecord::Base

  belongs_to :post

  validates :body, presence: true, uniqueness: {scope: :post_id}
  self.per_page = 5

  def self.search(str)
    where("body ILIKE ?", "%#{str}%")
  end


end
