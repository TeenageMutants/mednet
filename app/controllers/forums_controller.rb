class ForumsController < ApplicationController

  before_filter :check_auth, only: [:edit, :delete]

  before_filter :check_time_created_at, only: [:edit_comment, :delete_comment]

  def check_time_created_at
    @comment = Comment.find(params[:id])
    time_create = @comment.created_at
    time_now = Time.now
    delay_time = time_now - 15.minutes
    if time_create < delay_time
      post_id = @comment.post_id
      redirect_to forum_path(post_id), notice: "Запись нельзя отредактировать. Прошло больше 15 минут после ее создания."
    end
  end


  # def check_blank
  #   @comment = Comment.new(:parent_id => params[:parent_id])
  #   if @comment.body.blank?
  #     flash[:danger] = 'Поле не должны быть пустыми'
  #     # return new_comment
  #   end
  # end


  def check_auth
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      # or Users_Roles.find(current_user.id).role_id != 2
      flash[:notice] = "Редактирование чужой записи невозможно"
      redirect_to forums_path
    end
  end


  def new_comment
    @comment = Comment.new(:parent_id => params[:parent_id])
    @post = Post.find(params[:id])
  end

  def create_comment
    @comment = Comment.new(comment_params)

    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    if @comment.save
      flash[:success] = 'Ваш комментарий добавлен'
      redirect_to forum_path(params[:id])
    else
      render :new_comment
    end

  end

  def edit_comment
    @comment = Comment.find(params[:id])
    if params[:commit].present?
      @comment.update_attributes!(comment_params)
      id = @comment.post_id.to_i
      redirect_to forum_path(@comment.post_id.to_i), notice: "Комментарий изменен"
    end
  end

  def delete_comment
    @comment = Comment.find(params[:id])
    Comment.find(params[:id]).destroy
    redirect_to forum_path(@comment.post_id.to_i), notice: "Комментарий удален"
  end



  def index
    @post = Post.new
    @posts = Post.all

    @posts = Post.order(closed: :desc, attached: :asc).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15)

    @comment = Comment.new
  end



  def show
    @comments = Comment.order("comment_id")
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    @post = Post.find(params[:id])
  end





  # GET /forums/new
  def new
    @post = Post.new
  end

 # /forums POST
  def create
    # @post = Post.new(post_params)
    if params[:commit].present?
      @post = Post.add_post(post_params)
    end

    if @post.errors.empty?
      redirect_to forums_path, notice:"Тема создана"
    else
      flash[:notice] = "Заполните пустые поля"
      render 'new'
    end
  end


  def edit
    @post = Post.find(params[:id])
    if params[:save_post].present?
      @post.update_attributes!(post_params)
      # @post.update(post_params)

      redirect_to forums_path, notice: "Тема изменена"
    end
  end

  def delete
    Post.find(params[:id]).destroy
    redirect_to forums_path, notice: "Пост удален"
  end

  def closed
    post = Post.find(params[:id])
    post.closed = true
    post.save
    redirect_to forums_path, notice: "Тема закрыта для обсуждения"
  end


  def attached
    if params[:attached].present?
      post = Post.find(params[:id])
      post.attached = true
      post.save
    elsif params[:not_attached].present?

      post = Post.find(params[:id])
      post.attached = false
      post.save
    end

    redirect_to forums_path, notice: "Статус темы изменен"
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :closed, :attached)
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id, :parent_id)
  end

end

