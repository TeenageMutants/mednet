module ForumsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(:partial => 'comment', object: comment) + content_tag(:div, nested_comments(sub_comments),:class => "nested_comments")
    end.join.html_safe
  end

  def tr_style post
    if post.closed == true
      tr_attr = '#F6CED8'
    elsif post.attached == true
      tr_attr = '#E6F8E0'
    else
      tr_attr = 'white'

    end
    tr_attr
  end

  # def user_organization post_id
  #   userid = Post.find(post_id).user_id
  #   org_id = InfoDesk.find_by_user_id(userid).organization_id
  #   org_name = Organization.find(org_id).name
  #   return org_name
  # end

  def user_fio post_id
    userid = Comment.find_by_post_id(post_id).user_id
    fio = User.find(userid).fio
    return fio
  end

  # def comment_user_organization user_id
  #   userid = user_id
  #   if InfoDesk.find_by_user_id(userid).present?
  #     org_id = InfoDesk.find_by_user_id(userid).organization_id
  #     org_name = Organization.find(org_id).name
  #   else
  #     org_name = 'Организация не указана'
  #   end
  #   return org_name
  # end


end
