class ForumsController < ApplicationController

  before_filter :check_auth, only: [:edit, :delete]
  before_filter :check_role_id, only: [:create]

  def check_blank
    @comment = Comment.new(:parent_id => params[:parent_id])
    if @comment.body.blank?
      flash[:danger] = 'Поле не должны быть пустыми'
      # return new_comment
    end
  end

  def check_role_id
    unless User.find(current_user.id).role_id == 1
      redirect_to forums_path, notice: "Вам нельзя создавать темы"
    end
  end


  def check_auth
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id or User.find(current_user.id).role_id != 1
      flash[:notice] = "Редактирование чужой записи невозможно"
      redirect_to forums_path
    end
  end

  def new_comment
    @comment = Comment.new(:parent_id => params[:parent_id])
    @post = Post.find(params[:id])
  end

  def create_comment
    @comment = Comment.new(params[:comment])

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

    @posts = Post.order('attached DESC').order('closed').order('created_at DESC').paginate(:page => params[:page], :per_page => 10)

    @comment = Comment.new


  end

  def add_comment
    a = (Comment.find(params[:parent_id]).post_id).truncate
    @titl = Post.find(a).title
    @comments = Comment.where(post_id: params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    if params[:commit].present?
      # Comment.add_comment(params)
      Comment.create(comment_params)
      redirect_to forum_path(params[:id]), notice: "ок"
    end
    if @comment.body.blank?
      return flash[:danger] = 'Поля не должны быть пустыми'
    end
  end

  def show
    @comments = Comment.order("comment_id")
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    @post = Post.find(params[:id])
  end

  # def create
  #   @post = Post.new(post_params)
  #   if params[:commit].present?
  #     Post.add_post(params)
  #
  #     redirect_to forums_path, notice:"Тема создана"
  #   end
  # end

  # GET /forums/new
  def new
    # @post = Post.add_post(post_params)
    @post = Post.new
    if params[:commit].present?
      if @post.errors.empty?
        @post = Post.add_post(post_params)
        flash[:danger]= post_params

        redirect_to forums_path, notice: "Тема создана"
      else
        render 'new', notice: "NOT"
      end
    end
  end


  def create
    if params[:commit].present?
      if @post.errors.empty?
        @post = Post.create(post_params)
        redirect_to forums_path, notice: "Тема создана"
      else
        render 'new', notice: "NOT"
      end
    end
  end

    # @comment = Comment.new(:parent_id => params[:parent_id])
    # @post = Post.new

    # if @post.title.blank? || @post.body.blank?
    #   flash[:danger] = 'Поля не должны быть пустыми'
    #   render 'shared/modal_forum_post'
    # else
    #   Post.add_post(params)
    #   redirect_to forums_path, notice:"Тема создана"
    #   end



    # render text: params.inspect
  # end

  def edit
    @post = Post.find(params[:id])
    if params[:save_post].present?
      @post.update_attributes!(post_params)
      # @post.update(post_params)

      redirect_to forums_path, notice: "Тема изменена"
    end
  end

  def delete
    # if params[:del] == 'delete'
    Post.find(params[:id]).destroy
    # Comment.find(params[:post_id]).destroy
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

