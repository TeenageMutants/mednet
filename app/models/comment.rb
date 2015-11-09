class Comment < ActiveRecord::Base
  attr_accessor :body, :post_id, :user_id, :parent_id, :ancestry
  has_ancestry
  belongs_to :post
  self.per_page = 3
  # acts_as_tree order: 'created_at DESC'
  def self.add_comment params
    Comment.create(body: params[:body], post_id: params[:post_id],
                   parent_id: params[:parent_id], user_id: params[:user_id])

  end
  # validates :body, presence: true
end


