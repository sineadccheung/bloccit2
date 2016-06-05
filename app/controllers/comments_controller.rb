class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

   def create

     if params [:post_id]
       @post = Post.find(params[:post_id])
       @comment = @post.comments.new(comment_params)
       @comment.user = current_user
       @new_comment = Comment.new

       if @comment.save
         flash[:notice] = "Comment saved successfully."
       else
         flash[:alert] = "Comment failed to save."
       end
       respond_to do |format|
         format.html
         format.js
       end
     else
       @topic = Topic.find(params[:topic_id])
       @comment = @topic.comments.new(comment_params)
       @comment.user = current_user
       @new_comment = Comment.new

   end

   def destroy
     if [:topic_id]
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])

      if @comment.destroy
        flash[:notice] = "Comment was deleted successfully."

      else
        flash[:alert] = "Comment couldn't be deleted. Try again."
      end
      respond_to do |format|
         format.html
         format.js
       end
     else
       @topic = Topic.find(params[:topic_id])
       @comment = @topic.comments.find(params[:id])

       if @comment.destroy
         flash[:notice] = "Comment was deleted successfully."

       else
         flash[:alert] = "Comment couldn't be deleted. Try again."
       end
       respond_to do |format|
          format.html
          format.js
        end
  end

   private

   def comment_params
     params.require(:comment).permit(:body)
   end

   def authorize_user
     comment = Comment.find(params[:id])
     unless current_user == comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete a comment."
     end
   end
 end
