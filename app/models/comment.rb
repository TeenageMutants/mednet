class Comment < ActiveRecord::Base
  # attr_accessor :body, :post_id, :user_id, :parent_id, :ancestry
  has_ancestry
  belongs_to :post
  self.per_page = 3
  # acts_as_tree order: 'created_at DESC'
  def self.add_comment comment_params
    Comment.create(comment_params)

  end
  # validates :body, presence: true
end


