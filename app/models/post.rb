class Post < ActiveRecord::Base

  # attr_accessor :body, :title, :user_id, :updated_at, :created_at, :closed, :attached
  # validates :body, :title, presence: true
  has_many :comments, dependent: :destroy

  def self.add_post post_params
    Post.create(post_params)
    # Post.create(title: params[:title], body: params[:body], user_id: params[:user_id])
  end

end
