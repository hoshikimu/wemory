class PostCommentsController < ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image_id])
    @new_post_comment = PostComment.new(post_comment_params)
    @new_post_comment.user_id = current_user.id
    @new_post_comment.post_image_id = params[:post_image_id]
    if @new_post_comment.save
      @post_image.create_notification_comment(current_user, @new_post_comment.id)
      redirect_to post_image_path(params[:post_image_id])
    else
      @introduction = @post_image.introduction
      @permission_status = Approval.find_by(approver_id: @post_image.user_id, approvered_id: current_user.id, permission_status: "閲覧者(アルバム注文可)")
      @selected_post_comments = PostComment.where(post_image_id: params[:post_image_id]).order(created_at: "DESC").limit(5)
      @post_comments = PostComment.where(post_image_id: params[:post_image_id]).order(created_at: "DESC")
      render "post_images/show"
    end
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    if post_comment.destroy
      redirect_to post_image_path(params[:post_image_id])
    end
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
