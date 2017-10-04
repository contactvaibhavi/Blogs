class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user, only: [:destroy]
def create
end

def destroy
  end
  
  def toggle
  	@like = Like.new(like_params)
  	@comment.user = current_user
    @post = @comment.post
  	@comment.save

  	@comment.destroy
  end

  private

  def like_params
  	params.require(:like).permit(:likeable_id, :likeable_type)
  end

  def set_like
  	@comment = Comment.find(params[:id])
  end

  def authorize_user
  	if @comment.user != current_user
  		return redirect_to root_path
  	end
  	return true

  end
end
